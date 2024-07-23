import 'package:checkout_payment_integration/core/data/constants/api_constants/end_points.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/create_customer/create_customer_request_model/create_customer_request_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/create_customer/create_customer_response_model/create_customer_response_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/init_payment_sheet_request_model/init_payment_sheet_request_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_request_model/payment_intent_request_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_response_model/payment_intent_response_model.dart';
import 'package:checkout_payment_integration/infrastructure/services/remote/local/api/api_helper_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../../env/environment_variables.dart';
import 'dart:developer' as dev;

class StripeService {
  final ApiHelperImplementation apiService = ApiHelperImplementation();
  Future<PaymentIntentResponseModel> createPaymentIntent(
      PaymentIntentRequestModel paymentIntentRequestModel) async {
    var response = await apiService.post(
      data: paymentIntentRequestModel.toJson(),
     isMultipart: true,
      endPoint:createPaymentIntentEndPoint,
      token: EnvironmentVariables.setSecretKeyValue(),
    );

    var paymentIntentResponseModel = PaymentIntentResponseModel.fromJson(response);

    return paymentIntentResponseModel;
  }
  Future<CreateCustomersResponseModel> createCustomers({required CreateCustomerRequestModel createCustomerRequestModel}) async {
    var response = await apiService.post(
      data: createCustomerRequestModel.toJson(),
      isMultipart: true,
      endPoint:createCustomerEndPoint,
      token: EnvironmentVariables.setSecretKeyValue(),
    );
    var createCustomersResponseModel =CreateCustomersResponseModel.fromJson(response);
    dev.log(createCustomersResponseModel.id!);
    return createCustomersResponseModel;



  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }


  Future initPaymentSheet({required InitiPaymentSheetRequestModel initiPaymentSheetRequestModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initiPaymentSheetRequestModel.clientSecret,
        customerEphemeralKeySecret:
        initiPaymentSheetRequestModel.ephemeralKeySecret,
        customerId: initiPaymentSheetRequestModel.customerId,
        merchantDisplayName: 'esraa',
        style: ThemeMode.light


      ),
    );
  }


  Future makePayment({required PaymentIntentRequestModel paymentIntentRequestModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentRequestModel);
    var ephemeralKeyModel =
    await createEphemeralKey(customerId: paymentIntentRequestModel.cusomerId);
    var initPaymentSheetInputModel = InitiPaymentSheetRequestModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentRequestModel.cusomerId,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(initiPaymentSheetRequestModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        data: {'customer': customerId},
      isMultipart: true,
      isAddStripeVersion: true,
        endPoint: ephemeralKeysEndPoint,
        token:EnvironmentVariables.setSecretKeyValue(),
       );

    var ephermeralKey = EphemeralKeyModel.fromJson(response);

    return ephermeralKey;
  }


}

// / just fun to makePayment
// Future initPaymentSheet({required String paymentIntentClientSecret}) async {
//   await Stripe.instance.initPaymentSheet(
//     paymentSheetParameters: SetupPaymentSheetParameters(
//       paymentIntentClientSecret: paymentIntentClientSecret,
//       merchantDisplayName: 'esraa',
//     ),
//   );
// }
//
// Future makePayment(
//     {required PaymentIntentInputModel paymentIntentInputModel}) async {
//   var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
//   await initPaymentSheet(
//       paymentIntentClientSecret: paymentIntentModel.clientSecret!);
//   await displayPaymentSheet();
// }

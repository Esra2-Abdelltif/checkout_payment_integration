import 'package:checkout_payment_integration/core/data/constants/api_constants/end_points.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/create_customer/create_customer_request_model/create_customer_request_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/init_payment_sheet_request_model/init_payment_sheet_request_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_request_model/payment_intent_request_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_response_model/payment_intent_response_model.dart';
import 'package:checkout_payment_integration/infrastructure/services/remote/local/api/api_helper_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../../env/environment_variables.dart';


class StripeService {
  final ApiHelperImplementation apiService = ApiHelperImplementation();

  Future makePayment({required PaymentIntentRequestModel paymentIntentRequestModel,required CreateCustomerRequestModel createCustomerRequestModel}) async {
    String  customerId= await createCustomers(createCustomerRequestModel: createCustomerRequestModel);
    var paymentIntentModel = await createPaymentIntent(currency:paymentIntentRequestModel.currency,amount: paymentIntentRequestModel.amount,customerId: customerId );
    var ephemeralKeyModel = await createEphemeralKey(customerId: customerId);
    var initPaymentSheetInputModel = InitiPaymentSheetRequestModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: customerId,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(initiPaymentSheetRequestModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  ///1 step to createCustomers get customerId
  Future<String> createCustomers({required CreateCustomerRequestModel createCustomerRequestModel}) async {
    var response = await apiService.post(
      data: createCustomerRequestModel.toJson(),
      isMultipart: true,
      endPoint:createCustomerEndPoint,
      token: EnvironmentVariables.setSecretKeyStripeValue(),
    );
    return response["id"];



  }

  ///2 step createPaymentIntent
  Future<PaymentIntentResponseModel> createPaymentIntent(
      {required String currency,required int amount,required String  customerId}) async {
    var response = await apiService.post(
      data: {
        'amount':amount*100,
        'currency':currency,
        'customer':customerId,
    },
     isMultipart: true,
      endPoint:createPaymentIntentEndPoint,
      token: EnvironmentVariables.setSecretKeyStripeValue(),
    );

    var paymentIntentResponseModel = PaymentIntentResponseModel.fromJson(response);
    return paymentIntentResponseModel;
  }
  ///3
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
  ///4
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  ///5
  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(data: {'customer': customerId},
      isMultipart: true,
      isAddStripeVersion: true,
        endPoint: ephemeralKeysEndPoint,
        token:EnvironmentVariables.setSecretKeyStripeValue(),
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

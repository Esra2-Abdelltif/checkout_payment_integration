import 'package:checkout_payment_integration/core/data/constants/api_constants/end_points.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paymob_model/payment_paymob_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paymob_model/paymob_key_model.dart';
import 'package:checkout_payment_integration/infrastructure/services/remote/local/api/api_helper_implementation.dart';
import '../../../../env/environment_variables.dart';

class PayMobService {
  final ApiHelperImplementation apiService = ApiHelperImplementation();

  Future<String> makePayMobPayment({required PaymentPayMobRequestModel paymentPayMobRequestModel})async{
      String authanticationToken= await getAuthanticationToken();

      int orderId= await _getOrderId(
        authanticationToken: authanticationToken,
        amount: (paymentPayMobRequestModel.amount).toString(),
        currency: paymentPayMobRequestModel.currency,
      );

      String paymentKey= await _getPaymentKey(
        payMobKeyRequestModel: PayMobKeyRequestModel(
        authanticationToken: authanticationToken,
        amount: (paymentPayMobRequestModel.amount).toString(),
        currency: paymentPayMobRequestModel.currency,
        orderId: orderId.toString(),
      )
    );

      return "https://accept.paymob.com/api/acceptance/iframes/787141?payment_token=$paymentKey";
  }

  Future<String>getAuthanticationToken()async{
    var response = await apiService.post(
      data:{
        "api_key":EnvironmentVariables.setPayMobApiKeyValue(),
       },
      endPoint:authanticationTokenEndPoint,
    );
    return response["token"].toString();
  }

  Future<int>_getOrderId({
    required String authanticationToken,
    required String amount,
    required String currency,
  })async{
    var response = await apiService.post(
      data: {
        "auth_token":  authanticationToken,
        "amount_cents":"${amount}00", //  >>(STRING)<<
        "currency": currency,//Not Req
        "delivery_needed": "false",
        "items": [],
      },
      endPoint:orderIdEndPoint,
    );
    return response["id"]; //INTGER
  }

  Future<String> _getPaymentKey({
    required PayMobKeyRequestModel payMobKeyRequestModel,
  }) async{
    var response = await apiService.post(
        data: {
        //ALL OF THEM ARE REQIERD
        "expiration": 3600,
        "auth_token": payMobKeyRequestModel.authanticationToken,//From First Api
        "order_id":payMobKeyRequestModel.orderId,//From Second Api  >>(STRING)<<
        "integration_id": EnvironmentVariables.setCardPaymentMethodIntegrationIdValue(),//Integration Id Of The Payment Method
        "amount_cents": "${payMobKeyRequestModel.amount}00",
        "currency": payMobKeyRequestModel.currency,
        "billing_data": {
        //Have To Be Values
        "first_name": "Clifford",
        "last_name": "Nicolas",
        "email": "claudette09@exa.com",
        "phone_number": "+86(8)9135210487",

        //Can Set "NA"
        "apartment": "NA",
        "floor": "NA",
        "street": "NA",
        "building": "NA",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "state": "NA"
        },
        },
      endPoint:paymentKeyEndPoint,
    );
    return response["token"].toString();
  }


}


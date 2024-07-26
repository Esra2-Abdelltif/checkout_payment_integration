import 'dart:convert';
import 'package:checkout_payment_integration/core/data/constants/api_constants/end_points.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/paypal_without/create_paypal_model/create_paypal_model.dart';
import 'package:checkout_payment_integration/infrastructure/services/remote/local/api/api_helper_implementation.dart';
import '../../../../env/environment_variables.dart';

///NOT COMPLENTE

class PayPalService {
  final ApiHelperImplementation apiService = ApiHelperImplementation();

  Future<String> getAccessToken({required bool sandboxMode})async{
    final String authString = '${EnvironmentVariables.setClintIdPayPalKeyValue()}:${EnvironmentVariables.setSecretPayPalKeyValue()}';
    final String basicAuth = base64Encode(const Utf8Encoder().convert(authString));

    var response = await apiService.post(
      data: 'grant_type=client_credentials',
      isMultipart: true,
      endPoint:accessTokenEndPoint(sandboxMode: sandboxMode),
      token: basicAuth,
      basicToken: true
    );
    return response['access_token'].toString();

    }


  Future<CreatePayPalPaymentResponseModel> createPayPalPayment({required double amount,required String currency,required bool sandboxMode}) async {
    String accessToken = await getAccessToken(sandboxMode: sandboxMode);
    var response = await apiService.post(
        data: {
          "intent": "sale",
          "payer": {
            "payment_method": "paypal"
          },
          "transactions": [
            {
              "amount": {
                "total": amount.toString(),
                "currency": currency
              },
              "description": "Payment description"
            }
          ],
          "redirect_urls": {
            "return_url": "https://example.com/return",
            "cancel_url": "https://example.com/cancel"
          }
        },
        endPoint: createPaypalPaymentEndPoint(sandboxMode: sandboxMode),
        token: accessToken,
    );
    var createPayPalPaymentResponseModel = CreatePayPalPaymentResponseModel.fromJson(response);
    return createPayPalPaymentResponseModel;


  }

  Future<Map<String, dynamic>> executePayment({required bool sandboxMode, required dynamic   url, required String payerId, accessToken}) async {
    final accessToken = await getAccessToken(sandboxMode: sandboxMode);

    var response = await apiService.post(
        data: {
          'payer_id':payerId
        },
        endPoint: url,
        token: accessToken
    );
    return response;

}




}



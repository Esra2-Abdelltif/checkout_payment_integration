
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paymob_model/payment_paymob_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/paypal_without/create_paypal_model/create_paypal_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/create_customer/create_customer_request_model/create_customer_request_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_request_model/payment_intent_request_model.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentStripeRepository {

  Future<Either<ServerExceptions, String>> makeStripePayment(
      {required PaymentIntentRequestModel paymentIntentRequestModel,required CreateCustomerRequestModel createCustomerRequestModel});




  Future<Either<ServerExceptions, String>> makePayMobPayment({ required PaymentPayMobRequestModel paymentPayMobRequestModel});

  Future<Either<ServerExceptions, CreatePayPalPaymentResponseModel>> createPayPalPayment({ required double amount,required String currency,required bool sandboxMode});

  Future<Either<ServerExceptions, dynamic>> executePayPalPayment({ required bool sandboxMode, required String   url, required String payerId, });
}

import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paymob_model/payment_paymob_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/create_customer/create_customer_request_model/create_customer_request_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/create_customer/create_customer_response_model/create_customer_response_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_request_model/payment_intent_request_model.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentStripeRepository {

  Future<Either<ServerExceptions, String>> makePayment(
      {required PaymentIntentRequestModel paymentIntentRequestModel});

  Future<Either<ServerExceptions, CreateCustomersResponseModel>> createCustomer(
      {required CreateCustomerRequestModel createCustomerRequestModel});


  Future<Either<ServerExceptions, String>> makePayMobPayment({ required PaymentPayMobRequestModel paymentPayMobRequestModel});


}
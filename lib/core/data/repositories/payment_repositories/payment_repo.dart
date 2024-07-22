
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentStripeRepository {

  Future<Either<ServerExceptions, String>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});


}
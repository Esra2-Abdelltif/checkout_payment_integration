
import 'package:checkout_payment_integration/core/data/repositories/payment_repositories/payment_repo.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/conflict_exception.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';
import 'package:checkout_payment_integration/infrastructure/services/remote/local/stripe_service/stripe_service.dart';
import 'package:dartz/dartz.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentStripeReposImplementation extends PaymentStripeRepository {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<ServerExceptions, String>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right("");
    } on StripeException catch (e) {
      return left(ConflictException(
        errorCode:  e.error.message ?? 'Oops there was an error',
          errorMessage:  e.error.message ?? 'Oops there was an error',
        statusCode: e.hashCode
      ));
    } catch (e) {
      return left(ConflictException(
          errorCode:  e.toString() ?? 'Oops there was an error',
          errorMessage:  e.toString()?? 'Oops there was an error',
          statusCode: 409
      ));
    }
  }
  }




import 'package:checkout_payment_integration/core/data/repositories/payment_repositories/payment_repo.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/conflict_exception.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';
import 'package:checkout_payment_integration/infrastructure/services/remote/local/stripe_service/stripe_service.dart';
import 'package:dartz/dartz.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_request_model/payment_intent_request_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentStripeReposImplementation extends PaymentStripeRepository {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<ServerExceptions, String>> makePayment(
      {required PaymentIntentRequestModel paymentIntentRequestModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentRequestModel: paymentIntentRequestModel);

      return right("");
    } on StripeException catch (e) {
      return left(ConflictException(
        errorCode:  e.error.message ?? 'Oops there was an error',
          errorMessage:  e.error.message ?? 'Oops there was an error',
        statusCode: e.hashCode
      ));
    } catch (e) {
      return left(ConflictException(
          errorCode:  e.toString() ,
          errorMessage:  e.toString(),
          statusCode: 409
      ));
    }
  }
  }



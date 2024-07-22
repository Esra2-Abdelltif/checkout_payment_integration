
import 'package:checkout_payment_integration/core/data/model/payment_model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:checkout_payment_integration/core/data/repositories/payment_repositories/payment_repo.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';
import 'package:checkout_payment_integration/infrastructure/services/remote/local/stripe_service/stripe_service.dart';
import 'package:dartz/dartz.dart';

class PaymentStripeReposImplementation extends PaymentStripeRepository {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<ServerExceptions, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
 {
   return await stripeService.makePayment(
       paymentIntentInputModel: paymentIntentInputModel);

 }
 }
  //   try {
  //     await stripeService.makePayment(
  //         paymentIntentInputModel: paymentIntentInputModel);
  //
  //     return right(null);
  //   } on StripeException catch (e) {
  //     return left(PaymentException(
  //         errorMessage: e.error.message ?? 'Oops there was an error'));
  //   } catch (e) {
  //     return left(PaymentException(  errorMessage: e.toString()));
  //   }
  // }
  }



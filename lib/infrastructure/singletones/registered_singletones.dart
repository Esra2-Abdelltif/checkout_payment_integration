import 'package:checkout_payment_integration/core/data/repositories/payment_repositories/payment_repo.dart';
import 'package:checkout_payment_integration/core/data/repositories/payment_repositories/payment_repo_implementation.dart';
import 'package:checkout_payment_integration/infrastructure/services/remote/local/api/api_helper.dart';
import 'package:checkout_payment_integration/infrastructure/services/remote/local/api/api_helper_implementation.dart';
import 'package:get_it/get_it.dart';

final getSingleton = GetIt.instance;

class RegisteredSingleton {
  static Future<void> registerInstances() async {


    getSingleton.registerLazySingleton<ApiHelper>(() => ApiHelperImplementation());
    getSingleton.registerLazySingleton<PaymentStripeRepository>(() => PaymentStripeReposImplementation());


  }
}


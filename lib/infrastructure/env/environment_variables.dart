

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentVariables {
  //Env Files
  static const String envFileName = '.env';

  //Env variables
  ///dh ele mogod fe .env
  static const String SECRET_STRIPE_KEY = 'SECRET_STRIPE_KEY';
  static const String PUBLISHABLE_KEY = 'PUBLISHABLE_KEY';
  static const String SECRET_PAY_PAL_KEY = 'SECRET_PAY_PAL_KEY';
  static const String CLIENT_ID = 'CLIENT_ID';


  static Future<void> initEnvVariables() async {
    await dotenv.load(
      fileName: envFileName,);
  }

//fun to get secret key value from .env to use in any place in project
  static String setSecretKeyValue() {
    String res = dotenv.get(SECRET_STRIPE_KEY);

    return res;
  }
  static String setPublishableKeyValue() {
    String res = dotenv.get(PUBLISHABLE_KEY);

    return res;
  }
  static String setSecretPayPalKeyValue() {
    String res = dotenv.get(SECRET_PAY_PAL_KEY);

    return res;
  }
  static String setClintIdKeyValue() {
    String res = dotenv.get(CLIENT_ID);

    return res;
  }
}

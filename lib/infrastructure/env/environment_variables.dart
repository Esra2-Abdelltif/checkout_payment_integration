

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentVariables {
  //Env Files
  static const String envFileName = '.env';

  //Env variables
  ///dh ele mogod fe .env
  static const String SECRET_KEY = 'SECRET_KEY';
  static const String PUBLISHABLE_KEY = 'PUBLISHABLE_KEY';

  static Future<void> initEnvVariables() async {
    await dotenv.load(
      fileName: envFileName,);
  }

//fun to get secret key value from .env to use in any place in project
  static String setSecretKeyValue() {
    String res = dotenv.get(SECRET_KEY);

    return res;
  }
  static String setPublishableKeyValue() {
    String res = dotenv.get(PUBLISHABLE_KEY);

    return res;
  }
}

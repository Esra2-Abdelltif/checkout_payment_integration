
import 'package:checkout_payment_integration/infrastructure/utils/extensions/translator_extension.dart';

abstract class ServerExceptions {
  String? errorCode;
  String? errorMessage;
  int? statusCode;

  String getTranslatedErrorMessage() {
    //Default server message will be saved
    String localeString;
    String result = errorMessage!;
    String localeKey = _messageToLocaleKey();
    localeString = localeKey.translate;
    //IF Locale String Contains $ this means that it did not find the a translated string for this locale key and we should return the current error message

    if (!localeString.contains("\$")) {
      result = localeString;
    }
    return result;
  }

  String _messageToLocaleKey() {
    //Replace every space => ' ' with non space => '' to get the locale key eg. 'phonNumber already exists'  => 'phonnumberalreadyexists'
    return errorMessage!.replaceAll(' ', '').toLowerCase();
  }
}

import 'package:checkout_payment_integration/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_locales/flutter_locales.dart';

extension Translate on String {
  get translate => mainContext!.localeString(this).replaceAll('\$', '');
}

extension CurrentLanguage on BuildContext {
  get getCurrentLangCode => currentLocale.toString();
}

extension CurrentLanguageIsEN on BuildContext {
  bool get isCurrentLangIsEN =>
      getCurrentLangCode == LocaleLanguages.english ? true : false;
}
class LocaleLanguages {
  static String arabic = 'ar';
  static String english = 'en';
}
import 'package:flutter/material.dart';

extension GetDeviceHeight on BuildContext {
  double get height => MediaQuery.of(this).size.height;
}

extension GetDeviceWidth on BuildContext {
  double get width => MediaQuery.of(this).size.width;
}

extension CheckMobileDevice on BuildContext {
  bool get isMobileDevice =>
      MediaQuery.of(this).size.width < 950.0 ? true : false;
}

extension CheckSmallMobileDevice on BuildContext {
  bool get isSmallMobileDevice =>
      MediaQuery.of(this).size.width < 620.0 ? true : false;
}

extension CheckTabletDevice on BuildContext {
  bool get isTabletDevice => MediaQuery.of(this).size.width < 1400.0 &&
      MediaQuery.of(this).size.width >= 950.0
      ? true
      : false;
}
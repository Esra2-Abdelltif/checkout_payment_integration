import 'package:flutter/material.dart';

extension NavigationContext on BuildContext {
  get popContext => Navigator.pop(this);

  dynamic pushContext({required route}) => Navigator.push(
    this,
    MaterialPageRoute(
      builder: (context) => route,
    ),
  );

}
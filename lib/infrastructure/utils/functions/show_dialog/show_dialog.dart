import 'dart:ui';

import 'package:flutter/material.dart';

dialogWithBlurBackground({
  required BuildContext context,
  required Widget content,
  bool isAbsorbed = false,
}) {
  return showDialog(
    context: context,
    barrierDismissible: !isAbsorbed,
    builder: (context) => PopScope(
      //To Prevent Mobile Phones From Poping Back While Something important happeing
      canPop: !isAbsorbed,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(16),
          ),
          content: content,
        ),
      ),
    ),
  );
}
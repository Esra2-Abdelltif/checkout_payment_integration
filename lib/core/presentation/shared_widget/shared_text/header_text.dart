import 'package:checkout_payment_integration/core/infrastructure/utils/functions/text_size_responsvie/text_size_responsvie.dart';
import 'package:flutter/material.dart';

class AppBaHeaderText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const AppBaHeaderText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.fontWeight,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style:  TextStyle(
        color: Colors.black,
         fontSize: getResponsiveFontSize(baseFontSize: 25),
        fontFamily: 'Inter',
        fontWeight: fontWeight ??  FontWeight.w500,
        height: 0,
      )
    );
  }
}

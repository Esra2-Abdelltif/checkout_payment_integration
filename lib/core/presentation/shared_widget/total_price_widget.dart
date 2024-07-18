import 'package:checkout_payment_integration/core/presentation/themes/app_style/app_style.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  final String  value;

  const TotalPrice({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       const Text(
          "Total",
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.style24,
        )
      ],
    );
  }
}
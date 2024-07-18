import 'package:checkout_payment_integration/core/presentation/themes/app_style/app_style.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  final String title, value;

  const OrderInfoItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.style18,
        )
      ],
    );
  }
}

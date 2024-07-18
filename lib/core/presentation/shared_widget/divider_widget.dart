import 'package:checkout_payment_integration/core/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 2,
      height: 34,
      color:AppColors.hintTextColor,
    );
  }
}

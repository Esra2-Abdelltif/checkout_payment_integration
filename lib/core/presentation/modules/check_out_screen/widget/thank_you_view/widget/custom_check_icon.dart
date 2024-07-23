import 'package:checkout_payment_integration/core/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: AppColors.cardColor,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Icons.check,
          size: 50,
        ),
      ),
    );
  }
}
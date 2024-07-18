import 'package:checkout_payment_integration/core/presentation/constants/app_colors.dart';
import 'package:checkout_payment_integration/core/presentation/themes/app_style/app_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });

  final void Function()? onTap;

  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 73,
        decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
          )
              : Text(
            text,
            textAlign: TextAlign.center,
            style: Styles.style22,
          ),
        ),
      ),
    );
  }
}
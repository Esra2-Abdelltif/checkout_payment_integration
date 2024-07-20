import 'package:checkout_payment_integration/core/presentation/constants/app_image.dart';
import 'package:checkout_payment_integration/core/presentation/themes/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppImagePaths.masterCardImage),
          const SizedBox(
            width: 23,
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Credit Card ',
                  style: Styles.style18,
                ),
                TextSpan(
                  text: 'Mastercard **78',
                  style: Styles.style16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
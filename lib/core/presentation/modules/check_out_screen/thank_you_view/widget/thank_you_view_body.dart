import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/thank_you_view/widget/custom_check_icon.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/thank_you_view/widget/custom_dashed_line.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/thank_you_view/widget/thank_you_card.dart';
import 'package:checkout_payment_integration/infrastructure/utils/extensions/dimension_extension.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: context.height * .2 + 20,
            left: 28,
            right: 28,
            child: const CustomDashedLine(),
          ),
          Positioned(
              left: -20,
              bottom: context.height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: context.height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
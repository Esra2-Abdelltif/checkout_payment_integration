import 'package:checkout_payment_integration/core/presentation/constants/app_colors.dart';
import 'package:checkout_payment_integration/core/presentation/constants/app_spaces.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/thank_you_view/widget/card_info_widget.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/thank_you_view/widget/payment_info_item.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/total_price_widget.dart';
import 'package:checkout_payment_integration/core/presentation/themes/app_style/app_style.dart';
import 'package:checkout_payment_integration/infrastructure/utils/extensions/dimension_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color:AppColors.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50+16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            AppSpaces.vSpace42,
            const PaymentItemInfo(
              title: 'Date',
              value: '01/24/2023',
            ),
            AppSpaces.vSpace20,
            const PaymentItemInfo(
              title: 'Time',
              value: '10:15 AM',
            ),
            AppSpaces.vSpace20,
            const PaymentItemInfo(
              title: 'To',
              value: 'Sam Louis',
            ),
            const Divider(
              height: 60,
              thickness: 2,
            ),
            const TotalPrice(value: r'$50.97'),
            AppSpaces.vSpace30,

            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.style24
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((context.height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
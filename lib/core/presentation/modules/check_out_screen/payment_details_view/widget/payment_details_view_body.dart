import 'package:checkout_payment_integration/core/presentation/constants/app_spaces.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/payment_details_view/widget/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child:  Column(
        children: [
          const PaymentMethodsListView(),
          AppSpaces.vSpace16,
        ],
      ),
    );
  }
}

import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/payment_details_view/widget/payment_methods_list_view.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_button.dart';
import 'package:checkout_payment_integration/infrastructure/utils/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';

import '../payment_details_view.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0 || index ==2) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(
            // updatePaymentMethod: updatePaymentMethod,
          ),
          const SizedBox(
            height: 32,
          ),
      CustomButton(text: "Continue",onTap: (){
         context.pushContext(route:const PaymentDetailsView());
      })


        ],
      ),
    );
  }
}
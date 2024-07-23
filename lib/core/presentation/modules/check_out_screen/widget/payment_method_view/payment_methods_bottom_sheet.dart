import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/payment_method_view/widget/payment_btn.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/payment_method_view/widget/payment_methods_list_view.dart';
import 'package:flutter/material.dart';


class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0 || index == 2) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(
            // updatePaymentMethod: updatePaymentMethod,
          ),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer(isPaypal: false,)


        ],
      ),
    );
  }
}

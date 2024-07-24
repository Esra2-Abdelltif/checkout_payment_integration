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
  int indexList=0;

  updatePaymentMethod({required int index}) {
    indexList=index;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
           PaymentMethodsListView(
            updatePaymentMethod: updatePaymentMethod,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer(index: indexList,)


        ],
      ),
    );
  }
}


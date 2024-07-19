import 'package:checkout_payment_integration/core/presentation/constants/app_image.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/payment_details_view/widget/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key,
    // required this.updatePaymentMethod
  });

  // final Function({required int index}) updatePaymentMethod;
  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    AppImagePaths.cardImage,
    AppImagePaths.payPalImage,
    AppImagePaths.applePayImage,

  ];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12),
      child: SizedBox(
        height: 62,
        child: ListView.builder(
            itemCount: paymentMethodsItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    activeIndex = index;
                    setState(() {
                    }
                    );
                    // widget.updatePaymentMethod(index: activeIndex);
                  },
                  child: PaymentMethodItem(
                    isActive: activeIndex == index,
                    image: paymentMethodsItems[index],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
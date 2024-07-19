import 'package:checkout_payment_integration/core/presentation/constants/app_image.dart';
import 'package:checkout_payment_integration/core/presentation/constants/app_spaces.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/my_cart_view/widget/order_info_item.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/payment_details_view/payment_details_view.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_button.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/divider_widget.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/total_price_widget.dart';
import 'package:checkout_payment_integration/infrastructure/utils/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          Expanded(child: Center(child: Image.asset(AppImagePaths.basketImage))),
          AppSpaces.vSpace25,
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'42.97$',
          ),
          AppSpaces.vSpace3,
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          AppSpaces.vSpace3,
          const OrderInfoItem(
            title: 'Shipping',
            value: r'8$',
          ),
          const DividerWidget(),
          const TotalPrice(value: r'50$', ),
          AppSpaces.vSpace16,
          CustomButton(text: "Complete Payment",onTap: (){
            context.pushContext(route:const PaymentDetailsView());
          },isLoading: false,),
        ],
      ),
    );
  }
}

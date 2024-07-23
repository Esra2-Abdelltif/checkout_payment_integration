import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/payment_details_view/widget/payment_details_view_body.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SharedAppBarInMobileView(title: 'Payment Details'),
      body:  PaymentDetailsViewBody(),
    );
  }
}
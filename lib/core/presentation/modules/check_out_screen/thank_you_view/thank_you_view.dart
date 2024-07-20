import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/thank_you_view/widget/thank_you_view_body.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const SharedAppBarInMobileView(title: ''),
      body:  Transform.translate(
    offset: const Offset(0, -16), child:const ThankYouViewBody()),
    );
  }
}

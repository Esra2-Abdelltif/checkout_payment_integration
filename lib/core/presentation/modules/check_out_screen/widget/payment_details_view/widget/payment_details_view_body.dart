import 'dart:developer';
import 'package:checkout_payment_integration/core/presentation/constants/app_spaces.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/payment_details_view/widget/custom_credit_card.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/thank_you_view/thank_you_view.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_button.dart';
import 'package:checkout_payment_integration/infrastructure/utils/extensions/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 25),
      child: CustomScrollView(
        slivers: [
         SliverToBoxAdapter(
            child: CustomCreditCard(
               autovalidateMode: autovalidateMode,
              formKey:  formKey,
            ),
          ),
          SliverToBoxAdapter(child:   AppSpaces.vSpace16,),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal :20),
                  child: CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.pushContext(route: const ThankYouView());

                        log('payment');
                      } else {
                        // context.pushContext(route: const ThankYouView());
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: 'Payment',
                  ),
                )),
          ),
        ],
      ),
    );

  }
}

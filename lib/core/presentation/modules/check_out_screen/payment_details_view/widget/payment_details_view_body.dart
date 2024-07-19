import 'dart:developer';
import 'package:checkout_payment_integration/core/presentation/constants/app_spaces.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/payment_details_view/widget/custom_credit_card.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/payment_details_view/widget/payment_methods_list_view.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_button.dart';
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
          const SliverToBoxAdapter(
            child: PaymentMethodsListView(),
          ),
          SliverToBoxAdapter(child:   AppSpaces.vSpace34,),
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
                        log('payment');
                      } else {
                        // context.pushContext(route: const ThankYouView());
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return const ThankYouView();
                        // }));
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
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paymob_model/payment_paymob_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_request_model/payment_intent_request_model.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_cubit.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_listening_on_states.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_state.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/my_cart_view/my_cart_view.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/thank_you_view/thank_you_view.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_button.dart';
import 'package:checkout_payment_integration/infrastructure/utils/functions/execute_paypal_payment/execute%20_paypal_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  final int index;

  const CustomButtonBlocConsumer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        PaymentListenerOnStates.listenerOnStates(
            state, context, PaymentCubit.ofCurrentContext(context));
      },
      builder: (context, state) {
        PaymentCubit paymentCubit = PaymentCubit.ofCurrentContext(context);
        return CustomButton(
            onTap: () {
              if (index == 0) {
                executeStripePayment(context, paymentCubit);
              }
              if (index == 1) {
                var transctionsData = getTransctionsData();
                executePaypalPayment(
                    context: context,
                    nextScreenIfSuccess: const ThankYouView(),
                    nextScreenIfError: const MyCartViewSection(),
                    transctionsData: transctionsData);
              }
              if (index == 2) {
                pay(context, paymentCubit);
              }
            },
            isLoading: state is PaymentLoading ? true : false,
            text: 'Continue');
      },
    );
  }

  void executeStripePayment(BuildContext context, PaymentCubit paymentCubit) async {
    PaymentIntentRequestModel paymentIntentInputModel =
        PaymentIntentRequestModel(
      amount: 50,
      currency: 'USD',
      cusomerId: "cus_QWoz4ObCOvUhKH",
    );
    await paymentCubit.makeStripePayment(paymentIntentRequestModel: paymentIntentInputModel);
  }

  void pay(BuildContext context, PaymentCubit paymentCubit) {
    paymentCubit.makePayMobPayment(
      paymentPayMobRequestModel: PaymentPayMobRequestModel(amount: 50, currency: 'EGP'),
    );
  }
}


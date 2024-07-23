import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_request_model/payment_intent_request_model.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_cubit.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_state.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/thank_you_view/thank_you_view.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
  });

  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(PaymentCubit.ofCurrentContext(context).serverException!.errorMessage!));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is NoInternetConnectionState) {
          Navigator.of(context).pop();
          SnackBar snackBar = const SnackBar(content: Text("Check your internet connection"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        PaymentCubit paymentCubit=PaymentCubit.ofCurrentContext(context);
        return CustomButton(
            onTap: () {
              excuteStripePayment(context,paymentCubit);
            },
            isLoading: state is PaymentLoading ? true : false,
            text: 'Continue');
      },
    );
  }

  void excuteStripePayment(BuildContext context,PaymentCubit paymentCubit) {
    PaymentIntentRequestModel paymentIntentInputModel = PaymentIntentRequestModel(
      amount: 50,
      currency: 'USD',
      cusomerId: 'cus_QWBY2jpTOAo5Y6',
    );
    paymentCubit.makePayment(paymentIntentRequestModel: paymentIntentInputModel);
  }


}
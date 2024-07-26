import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_cubit.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_state.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/my_cart_view/my_cart_view.dart';
import 'package:checkout_payment_integration/infrastructure/utils/extensions/navigation_extension.dart';
import 'package:checkout_payment_integration/infrastructure/utils/widget/paymob_checkout_view.dart';
import 'package:checkout_payment_integration/infrastructure/utils/widget/paypal_checkout_view.dart';
import 'package:flutter/material.dart';
import '../widget/thank_you_view/thank_you_view.dart';

class PaymentListenerOnStates {
  static void listenerOnStates(
    state,
    BuildContext context,
      PaymentCubit paymentCubit,
  ) {

    //STRIPE
    if (state is PaymentStripeSuccess) {
      context.pushReplacementContext(route: const ThankYouView());
    }
    if (state is PaymentStripeFailure) {
      context.popContext();
      SnackBar snackBar = SnackBar(content: Text(paymentCubit.serverException!.errorMessage!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    //PAYMOB
    if (state is PaymentPayMobSuccess) {
      context.pushContext(route: PayMobCheckoutView(url: paymentCubit.url!,nextScreenIfError: const MyCartViewSection(),nextScreenIfSuccess: const ThankYouView(),),);
    }
    if (state is PaymentPayMobFailure) {
      context.popContext();
      SnackBar snackBar = SnackBar(content: Text(paymentCubit.serverException!.errorMessage!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    //paypal
    if (state is PaymentPayPalFailure) {
      context.popContext();
      SnackBar snackBar = SnackBar(content: Text(paymentCubit.serverException!.errorMessage!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    if (state is PaymentPayPalSuccess) {
       context.pushContext(
          route: PayPalCheckoutView(
            checkoutUrl: paymentCubit.createPayPalPaymentResponseModel.links!.firstWhere((link) => link.rel == 'approval_url').href,
            onSuccess: (Map params) async {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return const MyCartViewSection();
                }), (route) {
                if (route.settings.name == '/') {
                  return true;
                } else {
                  return false;
                }
              },
              );
            },
            onError: (error) {
              SnackBar snackBar = SnackBar(content: Text(error.toString()));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return const ThankYouView();
                }),
                    (route) {
                  return false;
                },
              );
            },
            onCancel: () {
              context.popContext;
            },
          )
      );}


    if (state is NoInternetConnectionState) {
      context.popContext();

      SnackBar snackBar = const SnackBar(content: Text("Check your internet connection"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    }

}























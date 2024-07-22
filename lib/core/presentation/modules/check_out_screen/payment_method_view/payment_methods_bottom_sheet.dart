import 'package:checkout_payment_integration/core/data/model/payment_model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/payment_method_view/payment_methods_list_view.dart';
import 'package:checkout_payment_integration/core/presentation/modules/manger/cubit/payment_cubit.dart';
import 'package:checkout_payment_integration/core/presentation/modules/manger/cubit/payment_listening_on_states.dart';
import 'package:checkout_payment_integration/core/presentation/modules/manger/cubit/payment_state.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0 || index == 2) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(
            // updatePaymentMethod: updatePaymentMethod,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              PaymentListenerOnStates.listenerOnStates(
                state,
                context,
                PaymentCubit.ofCurrentContext(context),
              );
            },
            builder: (context, state) {
              return CustomButton(text: "Continue",
                  isLoading:state is PaymentLoading?true:false,
                  onTap: () {
                    PaymentIntentInputModel paymentIntentInputModel =
                    PaymentIntentInputModel(
                      amount: '100',
                      currency: 'USD',
                      cusomerId: 'cus_Onu3Wcrzhehlez',
                    );
                    BlocProvider.of<PaymentCubit>(context).makePayment(
                        paymentIntentInputModel: paymentIntentInputModel);
                    // context.pushContext(route: const PaymentDetailsView());
                  });
            },
          )


        ],
      ),
    );
  }
}
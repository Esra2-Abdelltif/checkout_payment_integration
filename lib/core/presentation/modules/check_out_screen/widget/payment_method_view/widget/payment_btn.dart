import 'dart:developer';

import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/amount_model/amount_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/amount_model/details.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/item_list_model/item.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/item_list_model/item_list_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_request_model/payment_intent_request_model.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_cubit.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_state.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/my_cart_view/my_cart_view.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/thank_you_view/thank_you_view.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_button.dart';
import 'package:checkout_payment_integration/infrastructure/env/environment_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
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
              if (isPaypal) {
                var transctionsData = getTransctionsData();
                exceutePaypalPayment(context, transctionsData);
              } else {
                excuteStripePayment(context,paymentCubit);
              }
            },
            isLoading: state is PaymentLoading ? true : false,
            text: 'Continue');
      },
    );
  }

  void excuteStripePayment(BuildContext context,PaymentCubit paymentCubit) async{

    PaymentIntentRequestModel paymentIntentInputModel = PaymentIntentRequestModel(
      amount: 50,
      currency: 'USD',
      cusomerId: "cus_QWoz4ObCOvUhKH",
    );
     paymentCubit.createCustomer();
      await paymentCubit.makePayment(paymentIntentRequestModel: paymentIntentInputModel);
  }
  void exceutePaypalPayment(BuildContext context, ({AmountModel amount, ItemListModel itemList}) transctionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: EnvironmentVariables.setClintIdKeyValue(),
        secretKey: EnvironmentVariables.setSecretPayPalKeyValue(),
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transctionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const ThankYouView();
            }),
                (route) {
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
              return const MyCartViewSection();
            }),
                (route) {
              return false;
            },
          );
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
  ({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
    var amount = AmountModel(
        total: "100",
        currency: 'USD',
        details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'));

    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "5",
        quantity: 12,
      ),
    ];

    var itemList = ItemListModel(orders: orders);

    return (amount: amount, itemList: itemList);
  }
}
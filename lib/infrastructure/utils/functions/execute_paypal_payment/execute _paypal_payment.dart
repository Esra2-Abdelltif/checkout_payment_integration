import 'dart:developer';

import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/amount_model/amount_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/amount_model/details.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/item_list_model/item.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/item_list_model/item_list_model.dart';
import 'package:checkout_payment_integration/infrastructure/env/environment_variables.dart';
import 'package:checkout_payment_integration/infrastructure/utils/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

void executePaypalPayment({required BuildContext context,
  required Widget  nextScreenIfSuccess,
  required Widget  nextScreenIfError,
  required ({AmountModel amount, ItemListModel itemList,}) transctionsData}) {
  context.pushContext(route: PaypalCheckoutView(
    sandboxMode: true,
    clientId: EnvironmentVariables.setClintIdPayPalKeyValue(),
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
          return  nextScreenIfSuccess;
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
          return nextScreenIfError;
        }),
            (route) {
          return false;
        },
      );
    },
    onCancel: () {
      print('cancelled:');
     context.popContext;
    },
  ));

}
({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
  var amount = AmountModel(
      total: "50",
      currency: 'USD',
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: '50'));

  List<OrderItemModel> orders = [
    OrderItemModel(
      currency: 'USD',
      name: 'Apple',
      price: "10",
      quantity: 4,
    ),
    OrderItemModel(
      currency: 'USD',
      name: 'Apple',
      price: "10",
      quantity: 1,
    ),
  ];

  var itemList = ItemListModel(orders: orders);

  return (amount: amount, itemList: itemList);
}

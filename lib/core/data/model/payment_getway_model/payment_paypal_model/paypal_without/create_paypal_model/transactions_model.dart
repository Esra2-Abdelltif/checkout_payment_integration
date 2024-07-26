import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/amount_model/amount_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/paypal_without/create_paypal_model/item_list_model.dart';

class Transactions {
  AmountModel? amount;
  String? description;
  String? custom;
  String? invoiceNumber;
  ItemList? itemList;

  Transactions(
      {this.amount,
        this.description,
        this.custom,
        this.invoiceNumber,
        this.itemList});

  Transactions.fromJson(Map<String, dynamic> json) {
    amount =
    json['amount'] != null ?  AmountModel.fromJson(json['amount']) : null;
    description = json['description'];
    custom = json['custom'];
    invoiceNumber = json['invoice_number'];
    itemList = json['item_list'] != null
        ?  ItemList.fromJson(json['item_list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =<String, dynamic>{};
    if (amount != null) {
      data['amount'] = amount!.toJson();
    }
    data['description'] = description;
    data['custom'] = custom;
    data['invoice_number'] = invoiceNumber;
    if (itemList != null) {
      data['item_list'] = itemList!.toJson();
    }
    return data;
  }
}

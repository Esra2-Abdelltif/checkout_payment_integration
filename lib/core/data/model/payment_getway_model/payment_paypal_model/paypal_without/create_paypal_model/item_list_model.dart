import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/paypal_without/create_paypal_model/shipping_address_model.dart';

class ItemList {
  List<Items>? items;
  ShippingAddressModel? shippingAddress;

  ItemList({this.items, this.shippingAddress});

  ItemList.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add( Items.fromJson(v));
      });
    }
    shippingAddress = json['shipping_address'] != null
        ?  ShippingAddressModel.fromJson(json['shipping_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress!.toJson();
    }
    return data;
  }
}

class Items {
  String? name;
  String? description;
  String? quantity;
  String? price;
  String? tax;
  String? sku;
  String? currency;

  Items(
      {this.name,
        this.description,
        this.quantity,
        this.price,
        this.tax,
        this.sku,
        this.currency});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    tax = json['tax'];
    sku = json['sku'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['tax'] = tax;
    data['sku'] = sku;
    data['currency'] = currency;
    return data;
  }
}
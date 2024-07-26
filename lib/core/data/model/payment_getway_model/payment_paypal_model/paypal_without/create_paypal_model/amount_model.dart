import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/paypal_without/create_paypal_model/Details_model.dart';

class AmountModel {
  String? total;
  String? currency;
  DetailsModel? details;

  AmountModel({this.total, this.currency, this.details});

  AmountModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    currency = json['currency'];
    details =
    json['details'] != null ?  DetailsModel.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['currency'] = currency;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}

import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/paypal_without/create_paypal_model/links_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/paypal_without/create_paypal_model/payer_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/paypal_without/create_paypal_model/transactions_model.dart';

class CreatePayPalPaymentResponseModel {
  String? id;
  String? createTime;
  String? updateTime;
  String? state;
  String? intent;
  Payer? payer;
  List<Transactions>? transactions;
  List<Links>? links;

  CreatePayPalPaymentResponseModel(
      {this.id,
        this.createTime,
        this.updateTime,
        this.state,
        this.intent,
        this.payer,
        this.transactions,
        this.links});

  CreatePayPalPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    state = json['state'];
    intent = json['intent'];
    payer = json['payer'] != null ?  Payer.fromJson(json['payer']) : null;
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add( Transactions.fromJson(v));
      });
    }
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add( Links.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] =id;
    data['create_time'] =createTime;
    data['update_time'] =updateTime;
    data['state'] =state;
    data['intent'] =intent;
    if (this.payer != null) {
      data['payer'] =payer!.toJson();
    }
    if (this.transactions != null) {
      data['transactions'] =transactions!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] =links!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}







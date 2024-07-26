class PaymentOptions {
  String? allowedPaymentMethod;

  PaymentOptions({this.allowedPaymentMethod});

  PaymentOptions.fromJson(Map<String, dynamic> json) {
    allowedPaymentMethod = json['allowed_payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allowed_payment_method'] = allowedPaymentMethod;
    return data;
  }
}

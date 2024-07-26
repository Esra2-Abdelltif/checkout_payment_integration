class Payer {
  String? paymentMethod;

  Payer({this.paymentMethod});

  Payer.fromJson(Map<String, dynamic> json) {
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =<String, dynamic>{};
    data['payment_method'] =paymentMethod;
    return data;
  }
}
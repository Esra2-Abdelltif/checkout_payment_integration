class PaymentPayMobRequestModel {
  final int amount;
  final String currency;

  PaymentPayMobRequestModel(
      {required this.amount, required this.currency});

  toJson() {
    return {
      'amount': amount*100,
      'currency': currency,
    };
  }
}
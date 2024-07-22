class PaymentIntentInputModel {
  final int amount;
  final String currency;
  final String cusomerId;

  PaymentIntentInputModel(
      {required this.cusomerId, required this.amount, required this.currency});

  toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'customer': cusomerId
    };
  }
}
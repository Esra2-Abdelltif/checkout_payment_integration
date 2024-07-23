class PaymentIntentRequestModel {
  final int amount;
  final String currency;
  final String cusomerId;

  PaymentIntentRequestModel(
      {required this.cusomerId, required this.amount, required this.currency});

  toJson() {
    return {
      'amount': amount*100,
      'currency': currency,
      'customer': cusomerId
    };
  }
}
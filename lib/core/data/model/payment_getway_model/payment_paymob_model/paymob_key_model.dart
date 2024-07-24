class PayMobKeyRequestModel {
  final String currency;
  final String authanticationToken;
  final String orderId;
  final String amount;

  PayMobKeyRequestModel(
      {required this.amount,
      required this.currency,
      required this.authanticationToken,
      required this.orderId});
}

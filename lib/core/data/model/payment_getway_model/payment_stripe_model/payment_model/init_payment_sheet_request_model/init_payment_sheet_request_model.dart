class InitiPaymentSheetRequestModel {
  final String clientSecret;
  final String customerId;
  final String ephemeralKeySecret;

  InitiPaymentSheetRequestModel(
      {required this.clientSecret,
        required this.customerId,
        required this.ephemeralKeySecret});
}
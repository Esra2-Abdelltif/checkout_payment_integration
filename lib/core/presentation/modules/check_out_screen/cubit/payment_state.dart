
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}
class NoInternetConnectionState extends PaymentState {}

final class PaymentLoading extends PaymentState {}


final class PaymentStripeSuccess extends PaymentState {}
final class PaymentStripeFailure extends PaymentState {}


final class PaymentPayPalSuccess extends PaymentState {}
final class PaymentPayPalFailure extends PaymentState {}

final class PaymentPayMobSuccess extends PaymentState {}
final class PaymentPayMobFailure extends PaymentState {}

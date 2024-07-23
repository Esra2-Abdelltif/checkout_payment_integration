
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}
class NoInternetConnectionState extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {}

final class PaymentFailure extends PaymentState {}


final class CreateCustomerLoading extends PaymentState {}

final class CreateCustomerSuccess extends PaymentState {}

final class CreateCustomerFailure extends PaymentState {}
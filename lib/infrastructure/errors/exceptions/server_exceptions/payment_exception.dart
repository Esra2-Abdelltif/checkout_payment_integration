import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';

class PaymentException extends ServerExceptions {
  @override
  final String errorMessage;

  PaymentException({
    required this.errorMessage,

  });
}

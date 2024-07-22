import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';

class UnAuthorizedException extends ServerExceptions {
  @override
  final String errorCode;
  @override
  final String errorMessage;
  @override
  final int statusCode;

  UnAuthorizedException({
    required this.errorCode,
    required this.statusCode,
    required this.errorMessage,
  });
}

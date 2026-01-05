abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException(super.message);
}

class AuthException extends AppException {
  const AuthException(super.message);
}

class ValidationException extends AppException {
  const ValidationException(super.message);
}

class UnknownAppException extends AppException {
  const UnknownAppException(super.message);
}

import 'app_exception.dart';
import 'package:dio/dio.dart';

AppException mapToAppException(Object error) {
  if (error is AppException) return error;

  if (error is DioException) {
    final status = error.response?.statusCode;

    // 401/403: auth
    if (status == 401 || status == 403) {
      return const AuthException('Invalid email or password.');
    }

    // 400: validate
    if (status == 400) {
      // Nếu BE có message thì ưu tiên
      final msg = error.response?.data is Map
          ? (error.response?.data['message']?.toString())
          : null;
      return ValidationException(msg ?? 'Invalid request data.');
    }

    // timeout / no internet / cannot reach server
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError) {
      return const NetworkException('Unable to connect to the server.');
    }
    print(error.response?.data);
    return const UnknownAppException('Unexpected error occurred. Please try again.');
  }
  print('🔥 Original error: $error');
  return UnknownAppException(error.toString());
}

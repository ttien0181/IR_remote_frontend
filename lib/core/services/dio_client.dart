import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/config/app_config.dart';

class DioClient {
  late final Dio _dio;
  final FlutterSecureStorage _storage;
  final void Function()? onUnauthorized;

  DioClient({
    required FlutterSecureStorage storage,
    this.onUnauthorized,
  }) : _storage = storage {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onError: _onError,
      ),
    );
  }

  Dio get dio => _dio;

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Auto attach Bearer token for protected endpoints
    if (!options.path.startsWith('/auth/')) {
      final token = await _storage.read(key: AppConfig.tokenKey);
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    // Handle 401 Unauthorized
    if (error.response?.statusCode == 401) {
      // Clear token and user data
      await _storage.delete(key: AppConfig.tokenKey);
      await _storage.delete(key: AppConfig.userKey);
      
      // Trigger logout callback
      onUnauthorized?.call();
    }
    handler.next(error);
  }
}

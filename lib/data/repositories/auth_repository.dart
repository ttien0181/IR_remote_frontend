import 'package:dio/dio.dart';
import '../../data/models/api_response.dart';
import 'package:flutter_application_1/core/errors/app_exception.dart';
import 'package:flutter_application_1/core/errors/error_mapper.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    String? username,
  }) async {
    try {
      final response = await _dio.post('/auth/register', data: {
        'email': email,
        'password': password,
        if (username != null) 'username': username,
      });
      return response.data;
    } catch (e) {
      throw mapToAppException(e);
    }
  }
  

  Future<Map<String, dynamic>> verifyEmail({
    required String email,
    required String code,
  }) async {
    try {
      final response = await _dio.post('/auth/verify-email', data: {
        'email': email,
        'code': code,
      });
      return response.data;
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });
      final data = response.data['data'];

      if (data == null) {
        throw const AuthException('Login failed');
      }
      
      return AuthResponse.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<Map<String, dynamic>> resendCode({
    required String email,
  }) async {
    try {
      final response = await _dio.post('/auth/resend-code', data: {
        'email': email,
      });
      return response.data;
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

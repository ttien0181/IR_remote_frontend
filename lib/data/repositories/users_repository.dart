import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/errors/error_mapper.dart';
import 'package:flutter_application_1/data/models/user.dart';

class UsersRepository {
  final Dio _dio;

  UsersRepository({required Dio dio}) : _dio = dio;

  Future<User> getUser(String id) async {
    try {
      final response = await _dio.get('/users/$id');
      final data = response.data['data'];
      return User.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<User> updateUser({
    required String id,
    String? username,
    String? email,
  }) async {
    try {
      final response = await _dio.put(
        '/users/$id',
        data: {
          if (username != null) 'username': username,
          if (email != null) 'email': email,
        },
      );
      final data = response.data['data'];
      return User.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

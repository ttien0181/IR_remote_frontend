import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/config/app_config.dart';
import '../../data/models/user.dart';

class StorageService {
  final FlutterSecureStorage _storage;

  StorageService({required FlutterSecureStorage storage}) : _storage = storage;

  // Token management
  Future<void> saveToken(String token) async {
    await _storage.write(key: AppConfig.tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: AppConfig.tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: AppConfig.tokenKey);
  }

  // User management
  Future<void> saveUser(User user) async {
    final userJson = jsonEncode(user.toJson());
    await _storage.write(key: AppConfig.userKey, value: userJson);
  }

  Future<User?> getUser() async {
    final userJson = await _storage.read(key: AppConfig.userKey);
    if (userJson == null) return null;
    return User.fromJson(jsonDecode(userJson));
  }

  Future<void> deleteUser() async {
    await _storage.delete(key: AppConfig.userKey);
  }

  // User ID management
  Future<void> saveUserId(String userId) async {
    await _storage.write(key: AppConfig.userIdKey, value: userId);
  }

  Future<String?> getUserId() async {
    return await _storage.read(key: AppConfig.userIdKey);
  }

  Future<void> deleteUserId() async {
    await _storage.delete(key: AppConfig.userIdKey);
  }

  // Clear all
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

import 'package:dio/dio.dart';
import '../../data/models/controller.dart';
import '../../core/errors/error_mapper.dart';

class ControllersRepository {
  final Dio _dio;

  ControllersRepository({required Dio dio}) : _dio = dio;

  Future<List<Controller>> getControllers() async {
    try {
      final response = await _dio.get('/controllers');
      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => Controller.fromJson(json)).toList();
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<Controller> getController(String id) async {
    try {
      final response = await _dio.get('/controllers/$id');
      final data = response.data['data'] ?? response.data;
      return Controller.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<Controller> createController({
    required String name,
    String? description,
    String? roomId,
  }) async {
    try {
      final response = await _dio.post('/controllers', data: {
        'name': name,
        if (description != null) 'description': description,
        if (roomId != null) 'room_id': roomId,
      });
      final data = response.data['data'] ?? response.data;
      return Controller.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<Controller> updateController({
    required String id,
    String? name,
    String? description,
    String? roomId,
    bool? online,
  }) async {
    try {
      final response = await _dio.patch('/controllers/$id', data: {
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        if (roomId != null) 'room_id': roomId,
        if (online != null) 'online': online,
      });
      final data = response.data['data'] ?? response.data;
      return Controller.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<void> deleteController(String id) async {
    try {
      await _dio.delete('/controllers/$id');
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

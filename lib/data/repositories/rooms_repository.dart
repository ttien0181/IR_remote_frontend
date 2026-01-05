import 'package:dio/dio.dart';
import '../../data/models/room.dart';
import '../../core/errors/error_mapper.dart';

class RoomsRepository {
  final Dio _dio;

  RoomsRepository({required Dio dio}) : _dio = dio;

  Future<List<Room>> getRooms() async {
    try {
      final response = await _dio.get('/rooms');
      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => Room.fromJson(json)).toList();
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<Room> createRoom({
    required String name,
    String? description,
  }) async {
    try {
      final response = await _dio.post('/rooms', data: {
        'name': name,
        if (description != null) 'description': description,
      });
      final data = response.data['data'] ?? response.data;
      return Room.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<Room> updateRoom({
    required String id,
    String? name,
    String? description,
  }) async {
    try {
      final response = await _dio.patch('/rooms/$id', data: {
        if (name != null) 'name': name,
        if (description != null) 'description': description,
      });
      final data = response.data['data'] ?? response.data;
      return Room.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<void> deleteRoom(String id) async {
    try {
      await _dio.delete('/rooms/$id');
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

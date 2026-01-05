import 'package:dio/dio.dart';
import '../../data/models/controller.dart';
import '../../core/errors/error_mapper.dart';

class RoomControllersRepository {
  final Dio _dio;

  RoomControllersRepository({required Dio dio}) : _dio = dio;

  /// Get controllers for a specific room
  Future<List<Controller>> getControllersByRoom({required String roomId}) async {
    try {
      final response = await _dio.get('/controllers/room/$roomId');
      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => Controller.fromJson(json)).toList();
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

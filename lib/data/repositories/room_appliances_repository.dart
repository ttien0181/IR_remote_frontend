import 'package:dio/dio.dart';
import '../../data/models/appliance.dart';
import '../../core/errors/error_mapper.dart';

class RoomAppliancesRepository {
  final Dio _dio;

  RoomAppliancesRepository({required Dio dio}) : _dio = dio;

  /// Get appliances for a specific room
  Future<List<Appliance>> getAppliancesByRoom({required String roomId}) async {
    try {
      final response = await _dio.get('/appliances/room/$roomId');
      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => Appliance.fromJson(json)).toList();
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

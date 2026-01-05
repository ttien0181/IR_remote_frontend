import 'package:dio/dio.dart';
import '../../data/models/appliance.dart';
import '../../core/errors/error_mapper.dart';

class AppliancesRepository {
  final Dio _dio;

  AppliancesRepository({required Dio dio}) : _dio = dio;

  Future<List<Appliance>> getAppliances({
    String? roomId,
    String? controllerId,
    String? type,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (roomId != null) queryParams['room_id'] = roomId;
      if (controllerId != null) queryParams['controller_id'] = controllerId;
      if (type != null) queryParams['type'] = type;

      final response = await _dio.get('/appliances', queryParameters: queryParams.isEmpty ? null : queryParams);
      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => Appliance.fromJson(json)).toList();
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<Appliance> createAppliance({
    required String name,
    required String deviceType,
    required String roomId,
    required String controllerId,
    required String brand,
  }) async {
    try {
      final response = await _dio.post('/appliances', data: {
        'name': name,
        'device_type': deviceType,
        'brand': brand,
        'room_id': roomId,
        'controller_id': controllerId,
      });
      final data = response.data['data'] ?? response.data;
      return Appliance.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<Appliance> updateAppliance({
    required String id,
    String? name,
    String? deviceType,
    String? roomId,
    String? controllerId,
    String? brand,
  }) async {
    try {
      final response = await _dio.patch('/appliances/$id', data: {
        if (name != null) 'name': name,
        if (deviceType != null) 'device_type': deviceType,
        if (roomId != null) 'room_id': roomId,
        if (controllerId != null) 'controller_id': controllerId,
        if (brand != null) 'brand': brand,
      });
      final data = response.data['data'] ?? response.data;
      return Appliance.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<void> deleteAppliance(String id) async {
    try {
      await _dio.delete('/appliances/$id');
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

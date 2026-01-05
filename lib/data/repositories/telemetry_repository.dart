import 'package:dio/dio.dart';
import '../../data/models/telemetry.dart';
import '../../core/errors/error_mapper.dart';

class TelemetryRepository {
  final Dio _dio;

  TelemetryRepository({required Dio dio}) : _dio = dio;

  Future<List<Telemetry>> getLatestTelemetry(String controllerId) async {
    try {
      final response = await _dio.get('/telemetry/latest/$controllerId');
      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => Telemetry.fromJson(json)).toList();
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<List<TelemetryStat>> getStats({
    required String controllerId,
    required String metric,
    required DateTime startTime,
    required DateTime endTime,
    required String interval, // 'minute' | 'hour' | 'day'
  }) async {
    try {
      final response = await _dio.get('/telemetry/stats', queryParameters: {
        'controller_id': controllerId,
        'metric': metric,
        'start_time': startTime.toIso8601String(),
        'end_time': endTime.toIso8601String(),
        'interval': interval,
      });
      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => TelemetryStat.fromJson(json)).toList();
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

import 'package:dio/dio.dart';
import '../../data/models/appliance.dart';
import '../../core/errors/error_mapper.dart';

class ControllerAppliancesRepository {
  final Dio _dio;

  ControllerAppliancesRepository({required Dio dio}) : _dio = dio;

  /// Get appliances for a specific controller
  Future<List<Appliance>> getAppliancesByController({required String controllerId}) async {
    try {
      final response = await _dio.get('/appliances/controller/$controllerId');
      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => Appliance.fromJson(json)).toList();
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

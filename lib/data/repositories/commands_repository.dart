import 'package:dio/dio.dart';
import '../../data/models/command.dart';
import '../../core/errors/error_mapper.dart';

class CommandsRepository {
  final Dio _dio;

  CommandsRepository({required Dio dio}) : _dio = dio;

  Future<List<Command>> getCommands({int limit = 50}) async {
    try {
      final response = await _dio.get('/commands', queryParameters: {
        'limit': limit,
      });
      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => Command.fromJson(json)).toList();
    } catch (e) {
      throw mapToAppException(e);
    }
  }

  Future<Command> sendCommand({
    required String roomId,
    required String controllerId,
    required String applianceId,
    required String action,
    Map<String, dynamic>? payload,
    String? irCodeId,
  }) async {
    try {
      final response = await _dio.post('/commands/send', data: {
        'room_id': roomId,
        'controller_id': controllerId,
        'appliance_id': applianceId,
        'action': action,
        if (payload != null) 'payload': payload,
        if (irCodeId != null) 'ir_code_id': irCodeId,
      });
      final data = response.data['data'] ?? response.data;
      return Command.fromJson(data);
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

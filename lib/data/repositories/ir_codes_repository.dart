import 'package:dio/dio.dart';
import '../models/ir_code.dart';
import '../../core/errors/error_mapper.dart';

class IrCodesRepository {
  final Dio _dio;

  IrCodesRepository({required Dio dio}) : _dio = dio;

  /// Lấy danh sách IR codes với ID + action theo device type
  /// 
  /// Endpoint: GET /api/ir-codes/action?type={type}&brand={brand}
  /// 
  /// Parameters:
  /// - type (bắt buộc): Loại thiết bị (air_conditioner, tv, fan, etc.)
  /// - brand (tùy chọn): Thương hiệu để lọc thêm
  /// 
  /// Returns: List<IrCode> với _id, action, brand, protocol
  Future<List<IrCode>> getActions({
    required String type,
    required String brand,
  }) async {
    try {
      final response = await _dio.get(
        '/ir-codes/action',
        queryParameters: {
          'type': type,
          'brand': brand,
        },
      );
      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => IrCode.fromJson(json)).toList();
    } catch (e) {
      throw mapToAppException(e);
    }
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ir_code.freezed.dart';
part 'ir_code.g.dart';

@freezed
class IrCode with _$IrCode {
  const factory IrCode({
    @JsonKey(name: '_id') required String id,
    required String action,
    required String brand,
    required String protocol,
  }) = _IrCode;

  factory IrCode.fromJson(Map<String, dynamic> json) => _$IrCodeFromJson(json);
}

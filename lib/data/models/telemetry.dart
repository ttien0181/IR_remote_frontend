import 'package:freezed_annotation/freezed_annotation.dart';

part 'telemetry.freezed.dart';
part 'telemetry.g.dart';

@freezed
class Telemetry with _$Telemetry {
  const factory Telemetry({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'controller_id') required String controllerId,
    required String metric, // 'temperature', 'humidity', 'cpu_usage', etc.
    required double value,
    String? unit,
    required DateTime timestamp,
  }) = _Telemetry;

  factory Telemetry.fromJson(Map<String, dynamic> json) => _$TelemetryFromJson(json);
}

@freezed
class TelemetryStat with _$TelemetryStat {
  const factory TelemetryStat({
    required String metric,
    double? avg,
    double? min,
    double? max,
    int? count,
    DateTime? timestamp,
  }) = _TelemetryStat;

  factory TelemetryStat.fromJson(Map<String, dynamic> json) => _$TelemetryStatFromJson(json);
}

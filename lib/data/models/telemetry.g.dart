// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TelemetryImpl _$$TelemetryImplFromJson(Map<String, dynamic> json) =>
    _$TelemetryImpl(
      id: json['_id'] as String,
      controllerId: json['controller_id'] as String,
      metric: json['metric'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$TelemetryImplToJson(_$TelemetryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'controller_id': instance.controllerId,
      'metric': instance.metric,
      'value': instance.value,
      'unit': instance.unit,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$TelemetryStatImpl _$$TelemetryStatImplFromJson(Map<String, dynamic> json) =>
    _$TelemetryStatImpl(
      metric: json['metric'] as String,
      avg: (json['avg'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      count: (json['count'] as num?)?.toInt(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$TelemetryStatImplToJson(_$TelemetryStatImpl instance) =>
    <String, dynamic>{
      'metric': instance.metric,
      'avg': instance.avg,
      'min': instance.min,
      'max': instance.max,
      'count': instance.count,
      'timestamp': instance.timestamp?.toIso8601String(),
    };

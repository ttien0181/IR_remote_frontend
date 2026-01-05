// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ControllerImpl _$$ControllerImplFromJson(Map<String, dynamic> json) =>
    _$ControllerImpl(
      id: json['_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      ownerId: json['owner_id'],
      roomId: json['room_id'],
      mqttClientId: json['mqtt_client_id'] as String?,
      online: json['online'] as bool? ?? false,
      lastSeen: json['last_seen'] == null
          ? null
          : DateTime.parse(json['last_seen'] as String),
      hasIr: json['has_ir'] as bool? ?? true,
      hasSensors: json['has_sensors'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ControllerImplToJson(_$ControllerImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'owner_id': instance.ownerId,
      'room_id': instance.roomId,
      'mqtt_client_id': instance.mqttClientId,
      'online': instance.online,
      'last_seen': instance.lastSeen?.toIso8601String(),
      'has_ir': instance.hasIr,
      'has_sensors': instance.hasSensors,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appliance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplianceImpl _$$ApplianceImplFromJson(Map<String, dynamic> json) =>
    _$ApplianceImpl(
      id: json['_id'] as String?,
      name: json['name'] as String,
      brand: json['brand'] as String?,
      deviceType: json['device_type'] as String?,
      description: json['description'] as String?,
      ownerId: json['owner_id'],
      roomId: json['room_id'],
      controllerId: json['controller_id'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ApplianceImplToJson(_$ApplianceImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'device_type': instance.deviceType,
      'description': instance.description,
      'owner_id': instance.ownerId,
      'room_id': instance.roomId,
      'controller_id': instance.controllerId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

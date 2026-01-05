// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IrCodeRefImpl _$$IrCodeRefImplFromJson(Map<String, dynamic> json) =>
    _$IrCodeRefImpl(
      id: json['_id'] as String?,
      action: json['action'] as String?,
      protocol: json['protocol'] as String?,
    );

Map<String, dynamic> _$$IrCodeRefImplToJson(_$IrCodeRefImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'action': instance.action,
      'protocol': instance.protocol,
    };

_$CommandImpl _$$CommandImplFromJson(Map<String, dynamic> json) =>
    _$CommandImpl(
      id: json['_id'] as String?,
      userId: json['user_id'],
      roomId: json['room_id'],
      controllerId: json['controller_id'],
      applianceId: json['appliance_id'],
      irCodeId: json['ir_code_id'],
      action: json['action'] as String,
      topic: json['topic'] as String?,
      payload: json['payload'] as String?,
      status: json['status'] as String? ?? 'queued',
      error: json['error'] as String?,
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
      ackAt: json['ack_at'] == null
          ? null
          : DateTime.parse(json['ack_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CommandImplToJson(_$CommandImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'room_id': instance.roomId,
      'controller_id': instance.controllerId,
      'appliance_id': instance.applianceId,
      'ir_code_id': instance.irCodeId,
      'action': instance.action,
      'topic': instance.topic,
      'payload': instance.payload,
      'status': instance.status,
      'error': instance.error,
      'sent_at': instance.sentAt?.toIso8601String(),
      'ack_at': instance.ackAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';
import 'controller.dart';
import 'appliance.dart';
import 'room.dart';

part 'command.freezed.dart';
part 'command.g.dart';

// Simplified IR Code reference for Command populate
@freezed
class IrCodeRef with _$IrCodeRef {
  const factory IrCodeRef({
    @JsonKey(name: '_id') String? id,
    String? action,
    String? protocol,
  }) = _IrCodeRef;

  factory IrCodeRef.fromJson(Map<String, dynamic> json) => _$IrCodeRefFromJson(json);
}

@freezed
class Command with _$Command {
  const factory Command({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'user_id') dynamic userId, // String ID (list) or User object (detail)
    @JsonKey(name: 'room_id') dynamic roomId, // String ID (list) or Room object (detail)
    @JsonKey(name: 'controller_id') dynamic controllerId, // String ID (list) or Controller object (detail)
    @JsonKey(name: 'appliance_id') dynamic applianceId, // String ID (list) or Appliance object (detail)
    @JsonKey(name: 'ir_code_id') dynamic irCodeId, // String ID (list) or IrCodeRef object (detail)
    required String action,
    String? topic,
    String? payload,
    @Default('queued') String status, // 'queued', 'sent', 'acked', 'failed'
    String? error,
    @JsonKey(name: 'sent_at') DateTime? sentAt,
    @JsonKey(name: 'ack_at') DateTime? ackAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Command;

  factory Command.fromJson(Map<String, dynamic> json) => _$CommandFromJson(json);
}

extension CommandX on Command {
  String? get userIdAsString {
    if (userId is String) return userId as String;
    if (userId is User) return (userId as User).id;
    return null;
  }

  String? get roomIdAsString {
    if (roomId is String) return roomId as String;
    if (roomId is Room) return (roomId as Room).id;
    return null;
  }

  String? get controllerIdAsString {
    if (controllerId is String) return controllerId as String;
    if (controllerId is Controller) return (controllerId as Controller).id;
    return null;
  }

  String? get applianceIdAsString {
    if (applianceId is String) return applianceId as String;
    if (applianceId is Appliance) return (applianceId as Appliance).id;
    return null;
  }

  String? get irCodeIdAsString {
    if (irCodeId is String) return irCodeId as String;
    if (irCodeId is IrCodeRef) return (irCodeId as IrCodeRef).id;
    return null;
  }
}

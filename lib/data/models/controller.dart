import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';
import 'room.dart';

part 'controller.freezed.dart';
part 'controller.g.dart';

@freezed
class Controller with _$Controller {
  const factory Controller({
    @JsonKey(name: '_id') String? id,
    required String name,
    String? description,
    @JsonKey(name: 'owner_id') dynamic ownerId, // String ID (list) or User object (detail)
    @JsonKey(name: 'room_id') dynamic roomId, // String ID (list) or Room object (detail)
    @JsonKey(name: 'mqtt_client_id') String? mqttClientId,
    @Default(false) bool online,
    @JsonKey(name: 'last_seen') DateTime? lastSeen,
    @JsonKey(name: 'has_ir') @Default(true) bool hasIr,
    @JsonKey(name: 'has_sensors') @Default(false) bool hasSensors,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Controller;

  factory Controller.fromJson(Map<String, dynamic> json) => _$ControllerFromJson(json);
}

extension ControllerX on Controller {
  String? get ownerIdAsString {
    if (ownerId is String) return ownerId as String;
    if (ownerId is User) return (ownerId as User).id;
    return null;
  }

  String? get roomIdAsString {
    if (roomId is String) return roomId as String;
    if (roomId is Room) return (roomId as Room).id;
    return null;
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';
import 'room.dart';
import 'controller.dart';

part 'appliance.freezed.dart';
part 'appliance.g.dart';

@freezed
class Appliance with _$Appliance {
  const factory Appliance({
    @JsonKey(name: '_id') String? id,
    required String name,
    String? brand,
    @JsonKey(name: 'device_type') String? deviceType,
    String? description,
    @JsonKey(name: 'owner_id') dynamic ownerId, // String ID (list) or User object (detail)
    @JsonKey(name: 'room_id') dynamic roomId, // String ID (list) or Room object (detail)
    @JsonKey(name: 'controller_id') dynamic controllerId, // String ID (list) or Controller object (detail)
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Appliance;

  factory Appliance.fromJson(Map<String, dynamic> json) => _$ApplianceFromJson(json);
}

extension ApplianceX on Appliance {
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

  String? get controllerIdAsString {
    if (controllerId is String) return controllerId as String;
    if (controllerId is Controller) return (controllerId as Controller).id;
    return null;
  }
}

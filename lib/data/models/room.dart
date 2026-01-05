import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    @JsonKey(name: '_id') String? id,
    required String name,
    String? description,
    @JsonKey(name: 'owner_id') dynamic ownerId, // String ID (list) or User object (detail)
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

extension RoomX on Room {
  String? get ownerIdAsString {
    if (ownerId is String) return ownerId as String;
    if (ownerId is User) return (ownerId as User).id;
    return null;
  }
}

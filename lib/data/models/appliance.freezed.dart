// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appliance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Appliance _$ApplianceFromJson(Map<String, dynamic> json) {
  return _Appliance.fromJson(json);
}

/// @nodoc
mixin _$Appliance {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_type')
  String? get deviceType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  dynamic get ownerId => throw _privateConstructorUsedError; // String ID (list) or User object (detail)
  @JsonKey(name: 'room_id')
  dynamic get roomId => throw _privateConstructorUsedError; // String ID (list) or Room object (detail)
  @JsonKey(name: 'controller_id')
  dynamic get controllerId => throw _privateConstructorUsedError; // String ID (list) or Controller object (detail)
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Appliance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Appliance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplianceCopyWith<Appliance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplianceCopyWith<$Res> {
  factory $ApplianceCopyWith(Appliance value, $Res Function(Appliance) then) =
      _$ApplianceCopyWithImpl<$Res, Appliance>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String name,
    String? brand,
    @JsonKey(name: 'device_type') String? deviceType,
    String? description,
    @JsonKey(name: 'owner_id') dynamic ownerId,
    @JsonKey(name: 'room_id') dynamic roomId,
    @JsonKey(name: 'controller_id') dynamic controllerId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  });
}

/// @nodoc
class _$ApplianceCopyWithImpl<$Res, $Val extends Appliance>
    implements $ApplianceCopyWith<$Res> {
  _$ApplianceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Appliance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? brand = freezed,
    Object? deviceType = freezed,
    Object? description = freezed,
    Object? ownerId = freezed,
    Object? roomId = freezed,
    Object? controllerId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            brand: freezed == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceType: freezed == deviceType
                ? _value.deviceType
                : deviceType // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            ownerId: freezed == ownerId
                ? _value.ownerId
                : ownerId // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            roomId: freezed == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            controllerId: freezed == controllerId
                ? _value.controllerId
                : controllerId // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApplianceImplCopyWith<$Res>
    implements $ApplianceCopyWith<$Res> {
  factory _$$ApplianceImplCopyWith(
    _$ApplianceImpl value,
    $Res Function(_$ApplianceImpl) then,
  ) = __$$ApplianceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String name,
    String? brand,
    @JsonKey(name: 'device_type') String? deviceType,
    String? description,
    @JsonKey(name: 'owner_id') dynamic ownerId,
    @JsonKey(name: 'room_id') dynamic roomId,
    @JsonKey(name: 'controller_id') dynamic controllerId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ApplianceImplCopyWithImpl<$Res>
    extends _$ApplianceCopyWithImpl<$Res, _$ApplianceImpl>
    implements _$$ApplianceImplCopyWith<$Res> {
  __$$ApplianceImplCopyWithImpl(
    _$ApplianceImpl _value,
    $Res Function(_$ApplianceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Appliance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? brand = freezed,
    Object? deviceType = freezed,
    Object? description = freezed,
    Object? ownerId = freezed,
    Object? roomId = freezed,
    Object? controllerId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ApplianceImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        brand: freezed == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceType: freezed == deviceType
            ? _value.deviceType
            : deviceType // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        ownerId: freezed == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        roomId: freezed == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        controllerId: freezed == controllerId
            ? _value.controllerId
            : controllerId // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplianceImpl implements _Appliance {
  const _$ApplianceImpl({
    @JsonKey(name: '_id') this.id,
    required this.name,
    this.brand,
    @JsonKey(name: 'device_type') this.deviceType,
    this.description,
    @JsonKey(name: 'owner_id') this.ownerId,
    @JsonKey(name: 'room_id') this.roomId,
    @JsonKey(name: 'controller_id') this.controllerId,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$ApplianceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplianceImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String name;
  @override
  final String? brand;
  @override
  @JsonKey(name: 'device_type')
  final String? deviceType;
  @override
  final String? description;
  @override
  @JsonKey(name: 'owner_id')
  final dynamic ownerId;
  // String ID (list) or User object (detail)
  @override
  @JsonKey(name: 'room_id')
  final dynamic roomId;
  // String ID (list) or Room object (detail)
  @override
  @JsonKey(name: 'controller_id')
  final dynamic controllerId;
  // String ID (list) or Controller object (detail)
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Appliance(id: $id, name: $name, brand: $brand, deviceType: $deviceType, description: $description, ownerId: $ownerId, roomId: $roomId, controllerId: $controllerId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplianceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.ownerId, ownerId) &&
            const DeepCollectionEquality().equals(other.roomId, roomId) &&
            const DeepCollectionEquality().equals(
              other.controllerId,
              controllerId,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    brand,
    deviceType,
    description,
    const DeepCollectionEquality().hash(ownerId),
    const DeepCollectionEquality().hash(roomId),
    const DeepCollectionEquality().hash(controllerId),
    createdAt,
    updatedAt,
  );

  /// Create a copy of Appliance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplianceImplCopyWith<_$ApplianceImpl> get copyWith =>
      __$$ApplianceImplCopyWithImpl<_$ApplianceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplianceImplToJson(this);
  }
}

abstract class _Appliance implements Appliance {
  const factory _Appliance({
    @JsonKey(name: '_id') final String? id,
    required final String name,
    final String? brand,
    @JsonKey(name: 'device_type') final String? deviceType,
    final String? description,
    @JsonKey(name: 'owner_id') final dynamic ownerId,
    @JsonKey(name: 'room_id') final dynamic roomId,
    @JsonKey(name: 'controller_id') final dynamic controllerId,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
  }) = _$ApplianceImpl;

  factory _Appliance.fromJson(Map<String, dynamic> json) =
      _$ApplianceImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get name;
  @override
  String? get brand;
  @override
  @JsonKey(name: 'device_type')
  String? get deviceType;
  @override
  String? get description;
  @override
  @JsonKey(name: 'owner_id')
  dynamic get ownerId; // String ID (list) or User object (detail)
  @override
  @JsonKey(name: 'room_id')
  dynamic get roomId; // String ID (list) or Room object (detail)
  @override
  @JsonKey(name: 'controller_id')
  dynamic get controllerId; // String ID (list) or Controller object (detail)
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of Appliance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplianceImplCopyWith<_$ApplianceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

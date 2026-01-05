// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Controller _$ControllerFromJson(Map<String, dynamic> json) {
  return _Controller.fromJson(json);
}

/// @nodoc
mixin _$Controller {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  dynamic get ownerId => throw _privateConstructorUsedError; // String ID (list) or User object (detail)
  @JsonKey(name: 'room_id')
  dynamic get roomId => throw _privateConstructorUsedError; // String ID (list) or Room object (detail)
  @JsonKey(name: 'mqtt_client_id')
  String? get mqttClientId => throw _privateConstructorUsedError;
  bool get online => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_seen')
  DateTime? get lastSeen => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_ir')
  bool get hasIr => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_sensors')
  bool get hasSensors => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Controller to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Controller
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ControllerCopyWith<Controller> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControllerCopyWith<$Res> {
  factory $ControllerCopyWith(
    Controller value,
    $Res Function(Controller) then,
  ) = _$ControllerCopyWithImpl<$Res, Controller>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String name,
    String? description,
    @JsonKey(name: 'owner_id') dynamic ownerId,
    @JsonKey(name: 'room_id') dynamic roomId,
    @JsonKey(name: 'mqtt_client_id') String? mqttClientId,
    bool online,
    @JsonKey(name: 'last_seen') DateTime? lastSeen,
    @JsonKey(name: 'has_ir') bool hasIr,
    @JsonKey(name: 'has_sensors') bool hasSensors,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  });
}

/// @nodoc
class _$ControllerCopyWithImpl<$Res, $Val extends Controller>
    implements $ControllerCopyWith<$Res> {
  _$ControllerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Controller
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? ownerId = freezed,
    Object? roomId = freezed,
    Object? mqttClientId = freezed,
    Object? online = null,
    Object? lastSeen = freezed,
    Object? hasIr = null,
    Object? hasSensors = null,
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
            mqttClientId: freezed == mqttClientId
                ? _value.mqttClientId
                : mqttClientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            online: null == online
                ? _value.online
                : online // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastSeen: freezed == lastSeen
                ? _value.lastSeen
                : lastSeen // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            hasIr: null == hasIr
                ? _value.hasIr
                : hasIr // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasSensors: null == hasSensors
                ? _value.hasSensors
                : hasSensors // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$ControllerImplCopyWith<$Res>
    implements $ControllerCopyWith<$Res> {
  factory _$$ControllerImplCopyWith(
    _$ControllerImpl value,
    $Res Function(_$ControllerImpl) then,
  ) = __$$ControllerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String name,
    String? description,
    @JsonKey(name: 'owner_id') dynamic ownerId,
    @JsonKey(name: 'room_id') dynamic roomId,
    @JsonKey(name: 'mqtt_client_id') String? mqttClientId,
    bool online,
    @JsonKey(name: 'last_seen') DateTime? lastSeen,
    @JsonKey(name: 'has_ir') bool hasIr,
    @JsonKey(name: 'has_sensors') bool hasSensors,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ControllerImplCopyWithImpl<$Res>
    extends _$ControllerCopyWithImpl<$Res, _$ControllerImpl>
    implements _$$ControllerImplCopyWith<$Res> {
  __$$ControllerImplCopyWithImpl(
    _$ControllerImpl _value,
    $Res Function(_$ControllerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Controller
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? ownerId = freezed,
    Object? roomId = freezed,
    Object? mqttClientId = freezed,
    Object? online = null,
    Object? lastSeen = freezed,
    Object? hasIr = null,
    Object? hasSensors = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ControllerImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
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
        mqttClientId: freezed == mqttClientId
            ? _value.mqttClientId
            : mqttClientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        online: null == online
            ? _value.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastSeen: freezed == lastSeen
            ? _value.lastSeen
            : lastSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        hasIr: null == hasIr
            ? _value.hasIr
            : hasIr // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasSensors: null == hasSensors
            ? _value.hasSensors
            : hasSensors // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$ControllerImpl implements _Controller {
  const _$ControllerImpl({
    @JsonKey(name: '_id') this.id,
    required this.name,
    this.description,
    @JsonKey(name: 'owner_id') this.ownerId,
    @JsonKey(name: 'room_id') this.roomId,
    @JsonKey(name: 'mqtt_client_id') this.mqttClientId,
    this.online = false,
    @JsonKey(name: 'last_seen') this.lastSeen,
    @JsonKey(name: 'has_ir') this.hasIr = true,
    @JsonKey(name: 'has_sensors') this.hasSensors = false,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$ControllerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ControllerImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String name;
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
  @JsonKey(name: 'mqtt_client_id')
  final String? mqttClientId;
  @override
  @JsonKey()
  final bool online;
  @override
  @JsonKey(name: 'last_seen')
  final DateTime? lastSeen;
  @override
  @JsonKey(name: 'has_ir')
  final bool hasIr;
  @override
  @JsonKey(name: 'has_sensors')
  final bool hasSensors;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Controller(id: $id, name: $name, description: $description, ownerId: $ownerId, roomId: $roomId, mqttClientId: $mqttClientId, online: $online, lastSeen: $lastSeen, hasIr: $hasIr, hasSensors: $hasSensors, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ControllerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.ownerId, ownerId) &&
            const DeepCollectionEquality().equals(other.roomId, roomId) &&
            (identical(other.mqttClientId, mqttClientId) ||
                other.mqttClientId == mqttClientId) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.hasIr, hasIr) || other.hasIr == hasIr) &&
            (identical(other.hasSensors, hasSensors) ||
                other.hasSensors == hasSensors) &&
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
    description,
    const DeepCollectionEquality().hash(ownerId),
    const DeepCollectionEquality().hash(roomId),
    mqttClientId,
    online,
    lastSeen,
    hasIr,
    hasSensors,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Controller
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ControllerImplCopyWith<_$ControllerImpl> get copyWith =>
      __$$ControllerImplCopyWithImpl<_$ControllerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ControllerImplToJson(this);
  }
}

abstract class _Controller implements Controller {
  const factory _Controller({
    @JsonKey(name: '_id') final String? id,
    required final String name,
    final String? description,
    @JsonKey(name: 'owner_id') final dynamic ownerId,
    @JsonKey(name: 'room_id') final dynamic roomId,
    @JsonKey(name: 'mqtt_client_id') final String? mqttClientId,
    final bool online,
    @JsonKey(name: 'last_seen') final DateTime? lastSeen,
    @JsonKey(name: 'has_ir') final bool hasIr,
    @JsonKey(name: 'has_sensors') final bool hasSensors,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
  }) = _$ControllerImpl;

  factory _Controller.fromJson(Map<String, dynamic> json) =
      _$ControllerImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'owner_id')
  dynamic get ownerId; // String ID (list) or User object (detail)
  @override
  @JsonKey(name: 'room_id')
  dynamic get roomId; // String ID (list) or Room object (detail)
  @override
  @JsonKey(name: 'mqtt_client_id')
  String? get mqttClientId;
  @override
  bool get online;
  @override
  @JsonKey(name: 'last_seen')
  DateTime? get lastSeen;
  @override
  @JsonKey(name: 'has_ir')
  bool get hasIr;
  @override
  @JsonKey(name: 'has_sensors')
  bool get hasSensors;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of Controller
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ControllerImplCopyWith<_$ControllerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

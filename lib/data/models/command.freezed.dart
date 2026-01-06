// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IrCodeRef _$IrCodeRefFromJson(Map<String, dynamic> json) {
  return _IrCodeRef.fromJson(json);
}

/// @nodoc
mixin _$IrCodeRef {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;
  String? get protocol => throw _privateConstructorUsedError;

  /// Serializes this IrCodeRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IrCodeRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IrCodeRefCopyWith<IrCodeRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IrCodeRefCopyWith<$Res> {
  factory $IrCodeRefCopyWith(IrCodeRef value, $Res Function(IrCodeRef) then) =
      _$IrCodeRefCopyWithImpl<$Res, IrCodeRef>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? action,
    String? protocol,
  });
}

/// @nodoc
class _$IrCodeRefCopyWithImpl<$Res, $Val extends IrCodeRef>
    implements $IrCodeRefCopyWith<$Res> {
  _$IrCodeRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IrCodeRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? action = freezed,
    Object? protocol = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            action: freezed == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String?,
            protocol: freezed == protocol
                ? _value.protocol
                : protocol // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IrCodeRefImplCopyWith<$Res>
    implements $IrCodeRefCopyWith<$Res> {
  factory _$$IrCodeRefImplCopyWith(
    _$IrCodeRefImpl value,
    $Res Function(_$IrCodeRefImpl) then,
  ) = __$$IrCodeRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? action,
    String? protocol,
  });
}

/// @nodoc
class __$$IrCodeRefImplCopyWithImpl<$Res>
    extends _$IrCodeRefCopyWithImpl<$Res, _$IrCodeRefImpl>
    implements _$$IrCodeRefImplCopyWith<$Res> {
  __$$IrCodeRefImplCopyWithImpl(
    _$IrCodeRefImpl _value,
    $Res Function(_$IrCodeRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IrCodeRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? action = freezed,
    Object? protocol = freezed,
  }) {
    return _then(
      _$IrCodeRefImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        action: freezed == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String?,
        protocol: freezed == protocol
            ? _value.protocol
            : protocol // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IrCodeRefImpl implements _IrCodeRef {
  const _$IrCodeRefImpl({
    @JsonKey(name: '_id') this.id,
    this.action,
    this.protocol,
  });

  factory _$IrCodeRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$IrCodeRefImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? action;
  @override
  final String? protocol;

  @override
  String toString() {
    return 'IrCodeRef(id: $id, action: $action, protocol: $protocol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IrCodeRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, action, protocol);

  /// Create a copy of IrCodeRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IrCodeRefImplCopyWith<_$IrCodeRefImpl> get copyWith =>
      __$$IrCodeRefImplCopyWithImpl<_$IrCodeRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IrCodeRefImplToJson(this);
  }
}

abstract class _IrCodeRef implements IrCodeRef {
  const factory _IrCodeRef({
    @JsonKey(name: '_id') final String? id,
    final String? action,
    final String? protocol,
  }) = _$IrCodeRefImpl;

  factory _IrCodeRef.fromJson(Map<String, dynamic> json) =
      _$IrCodeRefImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get action;
  @override
  String? get protocol;

  /// Create a copy of IrCodeRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IrCodeRefImplCopyWith<_$IrCodeRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Command _$CommandFromJson(Map<String, dynamic> json) {
  return _Command.fromJson(json);
}

/// @nodoc
mixin _$Command {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  dynamic get userId => throw _privateConstructorUsedError; // String ID (list) or User object (detail)
  @JsonKey(name: 'room_id')
  dynamic get roomId => throw _privateConstructorUsedError; // String ID (list) or Room object (detail)
  @JsonKey(name: 'controller_id')
  dynamic get controllerId => throw _privateConstructorUsedError; // String ID (list) or Controller object (detail)
  @JsonKey(name: 'appliance_id')
  dynamic get applianceId => throw _privateConstructorUsedError; // String ID (list) or Appliance object (detail)
  @JsonKey(name: 'ir_code_id')
  dynamic get irCodeId => throw _privateConstructorUsedError; // String ID (list) or IrCodeRef object (detail)
  String get action => throw _privateConstructorUsedError; // String? topic,
  // String? payload,
  String get status =>
      throw _privateConstructorUsedError; // 'queued', 'sent', 'acked', 'failed'
  String? get error => throw _privateConstructorUsedError;
  @JsonKey(name: 'sent_at')
  DateTime? get sentAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'ack_at')
  DateTime? get ackAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Command to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Command
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommandCopyWith<Command> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandCopyWith<$Res> {
  factory $CommandCopyWith(Command value, $Res Function(Command) then) =
      _$CommandCopyWithImpl<$Res, Command>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'user_id') dynamic userId,
    @JsonKey(name: 'room_id') dynamic roomId,
    @JsonKey(name: 'controller_id') dynamic controllerId,
    @JsonKey(name: 'appliance_id') dynamic applianceId,
    @JsonKey(name: 'ir_code_id') dynamic irCodeId,
    String action,
    String status,
    String? error,
    @JsonKey(name: 'sent_at') DateTime? sentAt,
    @JsonKey(name: 'ack_at') DateTime? ackAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  });
}

/// @nodoc
class _$CommandCopyWithImpl<$Res, $Val extends Command>
    implements $CommandCopyWith<$Res> {
  _$CommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Command
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? roomId = freezed,
    Object? controllerId = freezed,
    Object? applianceId = freezed,
    Object? irCodeId = freezed,
    Object? action = null,
    Object? status = null,
    Object? error = freezed,
    Object? sentAt = freezed,
    Object? ackAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            roomId: freezed == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            controllerId: freezed == controllerId
                ? _value.controllerId
                : controllerId // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            applianceId: freezed == applianceId
                ? _value.applianceId
                : applianceId // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            irCodeId: freezed == irCodeId
                ? _value.irCodeId
                : irCodeId // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            sentAt: freezed == sentAt
                ? _value.sentAt
                : sentAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            ackAt: freezed == ackAt
                ? _value.ackAt
                : ackAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
abstract class _$$CommandImplCopyWith<$Res> implements $CommandCopyWith<$Res> {
  factory _$$CommandImplCopyWith(
    _$CommandImpl value,
    $Res Function(_$CommandImpl) then,
  ) = __$$CommandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'user_id') dynamic userId,
    @JsonKey(name: 'room_id') dynamic roomId,
    @JsonKey(name: 'controller_id') dynamic controllerId,
    @JsonKey(name: 'appliance_id') dynamic applianceId,
    @JsonKey(name: 'ir_code_id') dynamic irCodeId,
    String action,
    String status,
    String? error,
    @JsonKey(name: 'sent_at') DateTime? sentAt,
    @JsonKey(name: 'ack_at') DateTime? ackAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  });
}

/// @nodoc
class __$$CommandImplCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$CommandImpl>
    implements _$$CommandImplCopyWith<$Res> {
  __$$CommandImplCopyWithImpl(
    _$CommandImpl _value,
    $Res Function(_$CommandImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Command
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? roomId = freezed,
    Object? controllerId = freezed,
    Object? applianceId = freezed,
    Object? irCodeId = freezed,
    Object? action = null,
    Object? status = null,
    Object? error = freezed,
    Object? sentAt = freezed,
    Object? ackAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$CommandImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        roomId: freezed == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        controllerId: freezed == controllerId
            ? _value.controllerId
            : controllerId // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        applianceId: freezed == applianceId
            ? _value.applianceId
            : applianceId // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        irCodeId: freezed == irCodeId
            ? _value.irCodeId
            : irCodeId // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        sentAt: freezed == sentAt
            ? _value.sentAt
            : sentAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        ackAt: freezed == ackAt
            ? _value.ackAt
            : ackAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
class _$CommandImpl implements _Command {
  const _$CommandImpl({
    @JsonKey(name: '_id') this.id,
    @JsonKey(name: 'user_id') this.userId,
    @JsonKey(name: 'room_id') this.roomId,
    @JsonKey(name: 'controller_id') this.controllerId,
    @JsonKey(name: 'appliance_id') this.applianceId,
    @JsonKey(name: 'ir_code_id') this.irCodeId,
    required this.action,
    this.status = 'queued',
    this.error,
    @JsonKey(name: 'sent_at') this.sentAt,
    @JsonKey(name: 'ack_at') this.ackAt,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$CommandImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommandImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final dynamic userId;
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
  @JsonKey(name: 'appliance_id')
  final dynamic applianceId;
  // String ID (list) or Appliance object (detail)
  @override
  @JsonKey(name: 'ir_code_id')
  final dynamic irCodeId;
  // String ID (list) or IrCodeRef object (detail)
  @override
  final String action;
  // String? topic,
  // String? payload,
  @override
  @JsonKey()
  final String status;
  // 'queued', 'sent', 'acked', 'failed'
  @override
  final String? error;
  @override
  @JsonKey(name: 'sent_at')
  final DateTime? sentAt;
  @override
  @JsonKey(name: 'ack_at')
  final DateTime? ackAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Command(id: $id, userId: $userId, roomId: $roomId, controllerId: $controllerId, applianceId: $applianceId, irCodeId: $irCodeId, action: $action, status: $status, error: $error, sentAt: $sentAt, ackAt: $ackAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.roomId, roomId) &&
            const DeepCollectionEquality().equals(
              other.controllerId,
              controllerId,
            ) &&
            const DeepCollectionEquality().equals(
              other.applianceId,
              applianceId,
            ) &&
            const DeepCollectionEquality().equals(other.irCodeId, irCodeId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.ackAt, ackAt) || other.ackAt == ackAt) &&
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
    const DeepCollectionEquality().hash(userId),
    const DeepCollectionEquality().hash(roomId),
    const DeepCollectionEquality().hash(controllerId),
    const DeepCollectionEquality().hash(applianceId),
    const DeepCollectionEquality().hash(irCodeId),
    action,
    status,
    error,
    sentAt,
    ackAt,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Command
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandImplCopyWith<_$CommandImpl> get copyWith =>
      __$$CommandImplCopyWithImpl<_$CommandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommandImplToJson(this);
  }
}

abstract class _Command implements Command {
  const factory _Command({
    @JsonKey(name: '_id') final String? id,
    @JsonKey(name: 'user_id') final dynamic userId,
    @JsonKey(name: 'room_id') final dynamic roomId,
    @JsonKey(name: 'controller_id') final dynamic controllerId,
    @JsonKey(name: 'appliance_id') final dynamic applianceId,
    @JsonKey(name: 'ir_code_id') final dynamic irCodeId,
    required final String action,
    final String status,
    final String? error,
    @JsonKey(name: 'sent_at') final DateTime? sentAt,
    @JsonKey(name: 'ack_at') final DateTime? ackAt,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
  }) = _$CommandImpl;

  factory _Command.fromJson(Map<String, dynamic> json) = _$CommandImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  dynamic get userId; // String ID (list) or User object (detail)
  @override
  @JsonKey(name: 'room_id')
  dynamic get roomId; // String ID (list) or Room object (detail)
  @override
  @JsonKey(name: 'controller_id')
  dynamic get controllerId; // String ID (list) or Controller object (detail)
  @override
  @JsonKey(name: 'appliance_id')
  dynamic get applianceId; // String ID (list) or Appliance object (detail)
  @override
  @JsonKey(name: 'ir_code_id')
  dynamic get irCodeId; // String ID (list) or IrCodeRef object (detail)
  @override
  String get action; // String? topic,
  // String? payload,
  @override
  String get status; // 'queued', 'sent', 'acked', 'failed'
  @override
  String? get error;
  @override
  @JsonKey(name: 'sent_at')
  DateTime? get sentAt;
  @override
  @JsonKey(name: 'ack_at')
  DateTime? get ackAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of Command
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommandImplCopyWith<_$CommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

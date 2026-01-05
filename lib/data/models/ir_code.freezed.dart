// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IrCode _$IrCodeFromJson(Map<String, dynamic> json) {
  return _IrCode.fromJson(json);
}

/// @nodoc
mixin _$IrCode {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;

  /// Serializes this IrCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IrCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IrCodeCopyWith<IrCode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IrCodeCopyWith<$Res> {
  factory $IrCodeCopyWith(IrCode value, $Res Function(IrCode) then) =
      _$IrCodeCopyWithImpl<$Res, IrCode>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String action,
    String brand,
    String protocol,
  });
}

/// @nodoc
class _$IrCodeCopyWithImpl<$Res, $Val extends IrCode>
    implements $IrCodeCopyWith<$Res> {
  _$IrCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IrCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? brand = null,
    Object? protocol = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            brand: null == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String,
            protocol: null == protocol
                ? _value.protocol
                : protocol // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IrCodeImplCopyWith<$Res> implements $IrCodeCopyWith<$Res> {
  factory _$$IrCodeImplCopyWith(
    _$IrCodeImpl value,
    $Res Function(_$IrCodeImpl) then,
  ) = __$$IrCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String action,
    String brand,
    String protocol,
  });
}

/// @nodoc
class __$$IrCodeImplCopyWithImpl<$Res>
    extends _$IrCodeCopyWithImpl<$Res, _$IrCodeImpl>
    implements _$$IrCodeImplCopyWith<$Res> {
  __$$IrCodeImplCopyWithImpl(
    _$IrCodeImpl _value,
    $Res Function(_$IrCodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IrCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? brand = null,
    Object? protocol = null,
  }) {
    return _then(
      _$IrCodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        brand: null == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String,
        protocol: null == protocol
            ? _value.protocol
            : protocol // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IrCodeImpl implements _IrCode {
  const _$IrCodeImpl({
    @JsonKey(name: '_id') required this.id,
    required this.action,
    required this.brand,
    required this.protocol,
  });

  factory _$IrCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$IrCodeImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String action;
  @override
  final String brand;
  @override
  final String protocol;

  @override
  String toString() {
    return 'IrCode(id: $id, action: $action, brand: $brand, protocol: $protocol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IrCodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, action, brand, protocol);

  /// Create a copy of IrCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IrCodeImplCopyWith<_$IrCodeImpl> get copyWith =>
      __$$IrCodeImplCopyWithImpl<_$IrCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IrCodeImplToJson(this);
  }
}

abstract class _IrCode implements IrCode {
  const factory _IrCode({
    @JsonKey(name: '_id') required final String id,
    required final String action,
    required final String brand,
    required final String protocol,
  }) = _$IrCodeImpl;

  factory _IrCode.fromJson(Map<String, dynamic> json) = _$IrCodeImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get action;
  @override
  String get brand;
  @override
  String get protocol;

  /// Create a copy of IrCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IrCodeImplCopyWith<_$IrCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

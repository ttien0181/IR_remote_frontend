// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  switch (json['runtimeType']) {
    case 'success':
      return ApiSuccess<T>.fromJson(json, fromJsonT);
    case 'error':
      return ApiError<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'ApiResponse',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$ApiResponse<T> {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, String? message) success,
    required TResult Function(String message, int? statusCode) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, String? message)? success,
    TResult? Function(String message, int? statusCode)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, String? message)? success,
    TResult Function(String message, int? statusCode)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiSuccess<T> value) success,
    required TResult Function(ApiError<T> value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiSuccess<T> value)? success,
    TResult? Function(ApiError<T> value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiSuccess<T> value)? success,
    TResult Function(ApiError<T> value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
    ApiResponse<T> value,
    $Res Function(ApiResponse<T>) then,
  ) = _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message!
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiSuccessImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiSuccessImplCopyWith(
    _$ApiSuccessImpl<T> value,
    $Res Function(_$ApiSuccessImpl<T>) then,
  ) = __$$ApiSuccessImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data, String? message});
}

/// @nodoc
class __$$ApiSuccessImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiSuccessImpl<T>>
    implements _$$ApiSuccessImplCopyWith<T, $Res> {
  __$$ApiSuccessImplCopyWithImpl(
    _$ApiSuccessImpl<T> _value,
    $Res Function(_$ApiSuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed, Object? message = freezed}) {
    return _then(
      _$ApiSuccessImpl<T>(
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiSuccessImpl<T> implements ApiSuccess<T> {
  const _$ApiSuccessImpl({
    required this.data,
    this.message,
    final String? $type,
  }) : $type = $type ?? 'success';

  factory _$ApiSuccessImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$ApiSuccessImplFromJson(json, fromJsonT);

  @override
  final T data;
  @override
  final String? message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiResponse<$T>.success(data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    message,
  );

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiSuccessImplCopyWith<T, _$ApiSuccessImpl<T>> get copyWith =>
      __$$ApiSuccessImplCopyWithImpl<T, _$ApiSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, String? message) success,
    required TResult Function(String message, int? statusCode) error,
  }) {
    return success(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, String? message)? success,
    TResult? Function(String message, int? statusCode)? error,
  }) {
    return success?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, String? message)? success,
    TResult Function(String message, int? statusCode)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiSuccess<T> value) success,
    required TResult Function(ApiError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiSuccess<T> value)? success,
    TResult? Function(ApiError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiSuccess<T> value)? success,
    TResult Function(ApiError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiSuccessImplToJson<T>(this, toJsonT);
  }
}

abstract class ApiSuccess<T> implements ApiResponse<T> {
  const factory ApiSuccess({required final T data, final String? message}) =
      _$ApiSuccessImpl<T>;

  factory ApiSuccess.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$ApiSuccessImpl<T>.fromJson;

  T get data;
  @override
  String? get message;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiSuccessImplCopyWith<T, _$ApiSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiErrorImplCopyWith(
    _$ApiErrorImpl<T> value,
    $Res Function(_$ApiErrorImpl<T>) then,
  ) = __$$ApiErrorImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, int? statusCode});
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiErrorImpl<T>>
    implements _$$ApiErrorImplCopyWith<T, $Res> {
  __$$ApiErrorImplCopyWithImpl(
    _$ApiErrorImpl<T> _value,
    $Res Function(_$ApiErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? statusCode = freezed}) {
    return _then(
      _$ApiErrorImpl<T>(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        statusCode: freezed == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiErrorImpl<T> implements ApiError<T> {
  const _$ApiErrorImpl({
    required this.message,
    this.statusCode,
    final String? $type,
  }) : $type = $type ?? 'error';

  factory _$ApiErrorImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$ApiErrorImplFromJson(json, fromJsonT);

  @override
  final String message;
  @override
  final int? statusCode;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiResponse<$T>.error(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<T, _$ApiErrorImpl<T>> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<T, _$ApiErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, String? message) success,
    required TResult Function(String message, int? statusCode) error,
  }) {
    return error(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, String? message)? success,
    TResult? Function(String message, int? statusCode)? error,
  }) {
    return error?.call(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, String? message)? success,
    TResult Function(String message, int? statusCode)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiSuccess<T> value) success,
    required TResult Function(ApiError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiSuccess<T> value)? success,
    TResult? Function(ApiError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiSuccess<T> value)? success,
    TResult Function(ApiError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiErrorImplToJson<T>(this, toJsonT);
  }
}

abstract class ApiError<T> implements ApiResponse<T> {
  const factory ApiError({
    required final String message,
    final int? statusCode,
  }) = _$ApiErrorImpl<T>;

  factory ApiError.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$ApiErrorImpl<T>.fromJson;

  @override
  String get message;
  int? get statusCode;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorImplCopyWith<T, _$ApiErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  String? get token => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  dynamic get userData => throw _privateConstructorUsedError;

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
    AuthResponse value,
    $Res Function(AuthResponse) then,
  ) = _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
  @useResult
  $Res call({
    String? token,
    String? message,
    @JsonKey(name: 'user') dynamic userData,
  });
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? message = freezed,
    Object? userData = freezed,
  }) {
    return _then(
      _value.copyWith(
            token: freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            userData: freezed == userData
                ? _value.userData
                : userData // ignore: cast_nullable_to_non_nullable
                      as dynamic,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthResponseImplCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$$AuthResponseImplCopyWith(
    _$AuthResponseImpl value,
    $Res Function(_$AuthResponseImpl) then,
  ) = __$$AuthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? token,
    String? message,
    @JsonKey(name: 'user') dynamic userData,
  });
}

/// @nodoc
class __$$AuthResponseImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthResponseImpl>
    implements _$$AuthResponseImplCopyWith<$Res> {
  __$$AuthResponseImplCopyWithImpl(
    _$AuthResponseImpl _value,
    $Res Function(_$AuthResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? message = freezed,
    Object? userData = freezed,
  }) {
    return _then(
      _$AuthResponseImpl(
        token: freezed == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        userData: freezed == userData
            ? _value.userData
            : userData // ignore: cast_nullable_to_non_nullable
                  as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseImpl implements _AuthResponse {
  const _$AuthResponseImpl({
    this.token,
    this.message,
    @JsonKey(name: 'user') this.userData,
  });

  factory _$AuthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseImplFromJson(json);

  @override
  final String? token;
  @override
  final String? message;
  @override
  @JsonKey(name: 'user')
  final dynamic userData;

  @override
  String toString() {
    return 'AuthResponse(token: $token, message: $message, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.userData, userData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    token,
    message,
    const DeepCollectionEquality().hash(userData),
  );

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      __$$AuthResponseImplCopyWithImpl<_$AuthResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseImplToJson(this);
  }
}

abstract class _AuthResponse implements AuthResponse {
  const factory _AuthResponse({
    final String? token,
    final String? message,
    @JsonKey(name: 'user') final dynamic userData,
  }) = _$AuthResponseImpl;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$AuthResponseImpl.fromJson;

  @override
  String? get token;
  @override
  String? get message;
  @override
  @JsonKey(name: 'user')
  dynamic get userData;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

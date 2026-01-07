// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'telemetry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Telemetry _$TelemetryFromJson(Map<String, dynamic> json) {
  return _Telemetry.fromJson(json);
}

/// @nodoc
mixin _$Telemetry {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'controller_id')
  String get controllerId => throw _privateConstructorUsedError;
  String get metric =>
      throw _privateConstructorUsedError; // 'temperature', 'humidity', 'cpu_usage', etc.
  double get value => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this Telemetry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Telemetry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TelemetryCopyWith<Telemetry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TelemetryCopyWith<$Res> {
  factory $TelemetryCopyWith(Telemetry value, $Res Function(Telemetry) then) =
      _$TelemetryCopyWithImpl<$Res, Telemetry>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'controller_id') String controllerId,
    String metric,
    double value,
    String? unit,
    DateTime timestamp,
  });
}

/// @nodoc
class _$TelemetryCopyWithImpl<$Res, $Val extends Telemetry>
    implements $TelemetryCopyWith<$Res> {
  _$TelemetryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Telemetry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? controllerId = null,
    Object? metric = null,
    Object? value = null,
    Object? unit = freezed,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            controllerId: null == controllerId
                ? _value.controllerId
                : controllerId // ignore: cast_nullable_to_non_nullable
                      as String,
            metric: null == metric
                ? _value.metric
                : metric // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
            unit: freezed == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String?,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TelemetryImplCopyWith<$Res>
    implements $TelemetryCopyWith<$Res> {
  factory _$$TelemetryImplCopyWith(
    _$TelemetryImpl value,
    $Res Function(_$TelemetryImpl) then,
  ) = __$$TelemetryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'controller_id') String controllerId,
    String metric,
    double value,
    String? unit,
    DateTime timestamp,
  });
}

/// @nodoc
class __$$TelemetryImplCopyWithImpl<$Res>
    extends _$TelemetryCopyWithImpl<$Res, _$TelemetryImpl>
    implements _$$TelemetryImplCopyWith<$Res> {
  __$$TelemetryImplCopyWithImpl(
    _$TelemetryImpl _value,
    $Res Function(_$TelemetryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Telemetry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? controllerId = null,
    Object? metric = null,
    Object? value = null,
    Object? unit = freezed,
    Object? timestamp = null,
  }) {
    return _then(
      _$TelemetryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        controllerId: null == controllerId
            ? _value.controllerId
            : controllerId // ignore: cast_nullable_to_non_nullable
                  as String,
        metric: null == metric
            ? _value.metric
            : metric // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
        unit: freezed == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TelemetryImpl implements _Telemetry {
  const _$TelemetryImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'controller_id') required this.controllerId,
    required this.metric,
    required this.value,
    this.unit,
    required this.timestamp,
  });

  factory _$TelemetryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TelemetryImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'controller_id')
  final String controllerId;
  @override
  final String metric;
  // 'temperature', 'humidity', 'cpu_usage', etc.
  @override
  final double value;
  @override
  final String? unit;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'Telemetry(id: $id, controllerId: $controllerId, metric: $metric, value: $value, unit: $unit, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TelemetryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.controllerId, controllerId) ||
                other.controllerId == controllerId) &&
            (identical(other.metric, metric) || other.metric == metric) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    controllerId,
    metric,
    value,
    unit,
    timestamp,
  );

  /// Create a copy of Telemetry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TelemetryImplCopyWith<_$TelemetryImpl> get copyWith =>
      __$$TelemetryImplCopyWithImpl<_$TelemetryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TelemetryImplToJson(this);
  }
}

abstract class _Telemetry implements Telemetry {
  const factory _Telemetry({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'controller_id') required final String controllerId,
    required final String metric,
    required final double value,
    final String? unit,
    required final DateTime timestamp,
  }) = _$TelemetryImpl;

  factory _Telemetry.fromJson(Map<String, dynamic> json) =
      _$TelemetryImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'controller_id')
  String get controllerId;
  @override
  String get metric; // 'temperature', 'humidity', 'cpu_usage', etc.
  @override
  double get value;
  @override
  String? get unit;
  @override
  DateTime get timestamp;

  /// Create a copy of Telemetry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TelemetryImplCopyWith<_$TelemetryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TelemetryStat _$TelemetryStatFromJson(Map<String, dynamic> json) {
  return _TelemetryStat.fromJson(json);
}

/// @nodoc
mixin _$TelemetryStat {
  String get metric => throw _privateConstructorUsedError;
  double? get avg => throw _privateConstructorUsedError;
  double? get min => throw _privateConstructorUsedError;
  double? get max => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this TelemetryStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TelemetryStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TelemetryStatCopyWith<TelemetryStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TelemetryStatCopyWith<$Res> {
  factory $TelemetryStatCopyWith(
    TelemetryStat value,
    $Res Function(TelemetryStat) then,
  ) = _$TelemetryStatCopyWithImpl<$Res, TelemetryStat>;
  @useResult
  $Res call({
    String metric,
    double? avg,
    double? min,
    double? max,
    int? count,
    DateTime? timestamp,
  });
}

/// @nodoc
class _$TelemetryStatCopyWithImpl<$Res, $Val extends TelemetryStat>
    implements $TelemetryStatCopyWith<$Res> {
  _$TelemetryStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TelemetryStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metric = null,
    Object? avg = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? count = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(
      _value.copyWith(
            metric: null == metric
                ? _value.metric
                : metric // ignore: cast_nullable_to_non_nullable
                      as String,
            avg: freezed == avg
                ? _value.avg
                : avg // ignore: cast_nullable_to_non_nullable
                      as double?,
            min: freezed == min
                ? _value.min
                : min // ignore: cast_nullable_to_non_nullable
                      as double?,
            max: freezed == max
                ? _value.max
                : max // ignore: cast_nullable_to_non_nullable
                      as double?,
            count: freezed == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int?,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TelemetryStatImplCopyWith<$Res>
    implements $TelemetryStatCopyWith<$Res> {
  factory _$$TelemetryStatImplCopyWith(
    _$TelemetryStatImpl value,
    $Res Function(_$TelemetryStatImpl) then,
  ) = __$$TelemetryStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String metric,
    double? avg,
    double? min,
    double? max,
    int? count,
    DateTime? timestamp,
  });
}

/// @nodoc
class __$$TelemetryStatImplCopyWithImpl<$Res>
    extends _$TelemetryStatCopyWithImpl<$Res, _$TelemetryStatImpl>
    implements _$$TelemetryStatImplCopyWith<$Res> {
  __$$TelemetryStatImplCopyWithImpl(
    _$TelemetryStatImpl _value,
    $Res Function(_$TelemetryStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TelemetryStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metric = null,
    Object? avg = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? count = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(
      _$TelemetryStatImpl(
        metric: null == metric
            ? _value.metric
            : metric // ignore: cast_nullable_to_non_nullable
                  as String,
        avg: freezed == avg
            ? _value.avg
            : avg // ignore: cast_nullable_to_non_nullable
                  as double?,
        min: freezed == min
            ? _value.min
            : min // ignore: cast_nullable_to_non_nullable
                  as double?,
        max: freezed == max
            ? _value.max
            : max // ignore: cast_nullable_to_non_nullable
                  as double?,
        count: freezed == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int?,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TelemetryStatImpl implements _TelemetryStat {
  const _$TelemetryStatImpl({
    required this.metric,
    this.avg,
    this.min,
    this.max,
    this.count,
    this.timestamp,
  });

  factory _$TelemetryStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$TelemetryStatImplFromJson(json);

  @override
  final String metric;
  @override
  final double? avg;
  @override
  final double? min;
  @override
  final double? max;
  @override
  final int? count;
  @override
  final DateTime? timestamp;

  @override
  String toString() {
    return 'TelemetryStat(metric: $metric, avg: $avg, min: $min, max: $max, count: $count, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TelemetryStatImpl &&
            (identical(other.metric, metric) || other.metric == metric) &&
            (identical(other.avg, avg) || other.avg == avg) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, metric, avg, min, max, count, timestamp);

  /// Create a copy of TelemetryStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TelemetryStatImplCopyWith<_$TelemetryStatImpl> get copyWith =>
      __$$TelemetryStatImplCopyWithImpl<_$TelemetryStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TelemetryStatImplToJson(this);
  }
}

abstract class _TelemetryStat implements TelemetryStat {
  const factory _TelemetryStat({
    required final String metric,
    final double? avg,
    final double? min,
    final double? max,
    final int? count,
    final DateTime? timestamp,
  }) = _$TelemetryStatImpl;

  factory _TelemetryStat.fromJson(Map<String, dynamic> json) =
      _$TelemetryStatImpl.fromJson;

  @override
  String get metric;
  @override
  double? get avg;
  @override
  double? get min;
  @override
  double? get max;
  @override
  int? get count;
  @override
  DateTime? get timestamp;

  /// Create a copy of TelemetryStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TelemetryStatImplCopyWith<_$TelemetryStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RealtimeTelemetryData _$RealtimeTelemetryDataFromJson(
  Map<String, dynamic> json,
) {
  return _RealtimeTelemetryData.fromJson(json);
}

/// @nodoc
mixin _$RealtimeTelemetryData {
  @JsonKey(name: 'controller_id')
  String get controllerId => throw _privateConstructorUsedError;
  String get metric => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'ts')
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this RealtimeTelemetryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RealtimeTelemetryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealtimeTelemetryDataCopyWith<RealtimeTelemetryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeTelemetryDataCopyWith<$Res> {
  factory $RealtimeTelemetryDataCopyWith(
    RealtimeTelemetryData value,
    $Res Function(RealtimeTelemetryData) then,
  ) = _$RealtimeTelemetryDataCopyWithImpl<$Res, RealtimeTelemetryData>;
  @useResult
  $Res call({
    @JsonKey(name: 'controller_id') String controllerId,
    String metric,
    double value,
    String unit,
    @JsonKey(name: 'ts') DateTime timestamp,
  });
}

/// @nodoc
class _$RealtimeTelemetryDataCopyWithImpl<
  $Res,
  $Val extends RealtimeTelemetryData
>
    implements $RealtimeTelemetryDataCopyWith<$Res> {
  _$RealtimeTelemetryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeTelemetryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controllerId = null,
    Object? metric = null,
    Object? value = null,
    Object? unit = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            controllerId: null == controllerId
                ? _value.controllerId
                : controllerId // ignore: cast_nullable_to_non_nullable
                      as String,
            metric: null == metric
                ? _value.metric
                : metric // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RealtimeTelemetryDataImplCopyWith<$Res>
    implements $RealtimeTelemetryDataCopyWith<$Res> {
  factory _$$RealtimeTelemetryDataImplCopyWith(
    _$RealtimeTelemetryDataImpl value,
    $Res Function(_$RealtimeTelemetryDataImpl) then,
  ) = __$$RealtimeTelemetryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'controller_id') String controllerId,
    String metric,
    double value,
    String unit,
    @JsonKey(name: 'ts') DateTime timestamp,
  });
}

/// @nodoc
class __$$RealtimeTelemetryDataImplCopyWithImpl<$Res>
    extends
        _$RealtimeTelemetryDataCopyWithImpl<$Res, _$RealtimeTelemetryDataImpl>
    implements _$$RealtimeTelemetryDataImplCopyWith<$Res> {
  __$$RealtimeTelemetryDataImplCopyWithImpl(
    _$RealtimeTelemetryDataImpl _value,
    $Res Function(_$RealtimeTelemetryDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RealtimeTelemetryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controllerId = null,
    Object? metric = null,
    Object? value = null,
    Object? unit = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$RealtimeTelemetryDataImpl(
        controllerId: null == controllerId
            ? _value.controllerId
            : controllerId // ignore: cast_nullable_to_non_nullable
                  as String,
        metric: null == metric
            ? _value.metric
            : metric // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeTelemetryDataImpl implements _RealtimeTelemetryData {
  const _$RealtimeTelemetryDataImpl({
    @JsonKey(name: 'controller_id') required this.controllerId,
    required this.metric,
    required this.value,
    required this.unit,
    @JsonKey(name: 'ts') required this.timestamp,
  });

  factory _$RealtimeTelemetryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealtimeTelemetryDataImplFromJson(json);

  @override
  @JsonKey(name: 'controller_id')
  final String controllerId;
  @override
  final String metric;
  @override
  final double value;
  @override
  final String unit;
  @override
  @JsonKey(name: 'ts')
  final DateTime timestamp;

  @override
  String toString() {
    return 'RealtimeTelemetryData(controllerId: $controllerId, metric: $metric, value: $value, unit: $unit, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeTelemetryDataImpl &&
            (identical(other.controllerId, controllerId) ||
                other.controllerId == controllerId) &&
            (identical(other.metric, metric) || other.metric == metric) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, controllerId, metric, value, unit, timestamp);

  /// Create a copy of RealtimeTelemetryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeTelemetryDataImplCopyWith<_$RealtimeTelemetryDataImpl>
  get copyWith =>
      __$$RealtimeTelemetryDataImplCopyWithImpl<_$RealtimeTelemetryDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeTelemetryDataImplToJson(this);
  }
}

abstract class _RealtimeTelemetryData implements RealtimeTelemetryData {
  const factory _RealtimeTelemetryData({
    @JsonKey(name: 'controller_id') required final String controllerId,
    required final String metric,
    required final double value,
    required final String unit,
    @JsonKey(name: 'ts') required final DateTime timestamp,
  }) = _$RealtimeTelemetryDataImpl;

  factory _RealtimeTelemetryData.fromJson(Map<String, dynamic> json) =
      _$RealtimeTelemetryDataImpl.fromJson;

  @override
  @JsonKey(name: 'controller_id')
  String get controllerId;
  @override
  String get metric;
  @override
  double get value;
  @override
  String get unit;
  @override
  @JsonKey(name: 'ts')
  DateTime get timestamp;

  /// Create a copy of RealtimeTelemetryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeTelemetryDataImplCopyWith<_$RealtimeTelemetryDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}

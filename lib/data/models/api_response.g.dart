// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiSuccessImpl<T> _$$ApiSuccessImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$ApiSuccessImpl<T>(
  data: fromJsonT(json['data']),
  message: json['message'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ApiSuccessImplToJson<T>(
  _$ApiSuccessImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'message': instance.message,
  'runtimeType': instance.$type,
};

_$ApiErrorImpl<T> _$$ApiErrorImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$ApiErrorImpl<T>(
  message: json['message'] as String,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ApiErrorImplToJson<T>(
  _$ApiErrorImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'message': instance.message,
  'statusCode': instance.statusCode,
  'runtimeType': instance.$type,
};

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      token: json['token'] as String?,
      message: json['message'] as String?,
      userData: json['user'],
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'message': instance.message,
      'user': instance.userData,
    };

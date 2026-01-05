import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success({
    required T data,
    String? message,
  }) = ApiSuccess<T>;

  const factory ApiResponse.error({
    required String message,
    int? statusCode,
  }) = ApiError<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);
}

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    String? token,
    String? message,
    @JsonKey(name: 'user') dynamic userData,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

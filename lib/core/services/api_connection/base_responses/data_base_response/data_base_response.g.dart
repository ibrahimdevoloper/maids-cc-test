// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBaseResponse<T> _$DataBaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    DataBaseResponse<T>(
      error: json['error'] as String? ?? '',
      message: json['message'] as String? ?? '',
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$DataBaseResponseToJson<T>(
  DataBaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

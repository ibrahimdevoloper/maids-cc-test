// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageBaseResponse<T> _$PageBaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PageBaseResponse<T>(
      currentPage: (PageBaseResponse.getFromMeta(json, 'current_page') as num?)
              ?.toInt() ??
          0,
      from: (PageBaseResponse.getFromMeta(json, 'from') as num?)?.toInt() ?? 0,
      lastPage:
          (PageBaseResponse.getFromMeta(json, 'last_page') as num?)?.toInt() ??
              0,
      total:
          (PageBaseResponse.getFromMeta(json, 'total') as num?)?.toInt() ?? 0,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$PageBaseResponseToJson<T>(
  PageBaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'total': instance.total,
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

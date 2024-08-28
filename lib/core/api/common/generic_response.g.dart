// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericResponse<T> _$GenericResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GenericResponse<T>(
      status: json['status'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      exceptionType:
          $enumDecodeNullable(_$ExceptionTypeEnumMap, json['exceptionType']),
    );

Map<String, dynamic> _$GenericResponseToJson<T>(
  GenericResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'exceptionType': _$ExceptionTypeEnumMap[instance.exceptionType],
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

const _$ExceptionTypeEnumMap = {
  ExceptionType.noNetwork: 'noNetwork',
  ExceptionType.timeout: 'timeout',
  ExceptionType.others: 'others',
};

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

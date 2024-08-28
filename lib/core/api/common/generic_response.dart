import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

import 'exception.dart';

part 'generic_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenericResponse<T> implements ApiException {
  String? status;
  int? code;
  String? message;
  T? data;
  @override
  ExceptionType? exceptionType;

  GenericResponse({
    this.status,
    this.code,
    this.message,
    this.data,
    this.exceptionType,
  });

  factory GenericResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$GenericResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$GenericResponseToJson(this, toJsonT);

  bool isSuccess() {
    if (this.code == HttpStatus.ok || this.code == HttpStatus.created) {
      return true;
    } else {
      return false;
    }
  }
}

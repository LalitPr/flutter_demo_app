import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import '../../../utility/constants/constants.dart';
import '../../../utility/constants/query_parameters.dart';
import '../common/index.dart';

class NetworkManager {
  final String baseUrl;

  NetworkManager({required this.baseUrl});

  Future<Map<String, String>> _generateHeaders(
      Map<String, String>? headers) async {
    final requestHeaders = headers ?? {};
    final packageInfo = await PackageInfo.fromPlatform();
    requestHeaders[QueryParameters.appVersion] = packageInfo.version;
    requestHeaders[QueryParameters.contentType] = Constants.applicationJson;

    return requestHeaders;
  }

  Future<GenericResponse<T>> _executeHttpRequest<T>(
      Future<http.Response> Function() request,
      T Function(Object? json) fromJson) async {
    try {
      final response = await request();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
        return GenericResponse<T>.fromJson(responseBody, fromJson);
      } else {
        return GenericResponse<T>()
          ..exceptionType = ExceptionType.httpError
          ..message = 'HTTP error: ${response.statusCode}';
      }
    } catch (exception) {
      return GenericResponse<T>()
        ..exceptionType = fetchGenericExceptionResponse(exception)
        ..message = exception.toString();
    }
  }

  Future<GenericResponse<T>> get<T>(
    String endPoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    required T Function(Object? json) fromJson,
  }) {
    var url = Uri.parse('$baseUrl$endPoint');
    url = url.replace(queryParameters: queryParameters);
    Future<http.Response> request() async =>
        await http.get(url, headers: await _generateHeaders(headers));
    return _executeHttpRequest<T>(request, fromJson);
  }

  Future<GenericResponse<T>> post<T>(
    String endPoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
    Encoding? encoding,
    required T Function(Object? json) fromJson,
  }) {
    var url = Uri.parse('$baseUrl$endPoint');
    url = url.replace(queryParameters: queryParameters);
    Future<http.Response> request() async => await http.post(
          url,
          headers: await _generateHeaders(headers),
          body: body,
          encoding: encoding,
        );
    return _executeHttpRequest<T>(request, fromJson);
  }
}

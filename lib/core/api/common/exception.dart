import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';

abstract class ApiException {
  ExceptionType? get exceptionType;
}

enum ExceptionType {
  httpError,
  noNetwork,
  timeout,
  others,
}

ExceptionType fetchGenericExceptionResponse(Object exception) {
  if (exception is SocketException || exception is ClientException) {
    return ExceptionType.noNetwork;
  } else if (exception is TimeoutException) {
    return ExceptionType.timeout;
  } else {
    return ExceptionType.others;
  }
}

import 'package:dio/dio.dart';

class HttpClientCustomException extends DioException {
  HttpClientCustomException({
    required super.requestOptions,
    super.response,
    super.type = DioExceptionType.unknown,
    super.error,
    super.message,
    StackTrace? stackTrace,
  });
}

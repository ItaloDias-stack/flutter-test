import 'package:dio/dio.dart';

class DioConfig {
  late final Dio _dio;
  late final String baseUrl;

  Dio get dio => _dio;

  DioConfig(this.baseUrl) {
    _init();
  }

  void _init() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    _dio.interceptors.addAll([CustomInterceptors(dio)]);
  }
}

class CustomInterceptors extends InterceptorsWrapper {
  final Dio? dio;
  final Function(RequestOptions, RequestInterceptorHandler)? onRequestFunction;

  final Function(DioException, ErrorInterceptorHandler)? onErrorFunction;

  CustomInterceptors(this.dio, {this.onRequestFunction, this.onErrorFunction});

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (onRequestFunction != null) {
      onRequestFunction!(options, handler);
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (onErrorFunction != null) {
      onErrorFunction!(err, handler);
    }
  }
}

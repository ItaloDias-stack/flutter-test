import 'package:flutter_test_rafa/core/enums/api_failure_type.enum.dart';

class Result<E extends ApiFailureInfo, T> {
  final E? _error;
  final T? _data;

  const Result._(this._error, this._data);

  E? get failure => _error;
  T? get data => _data;

  bool get isSuccess => _data != null;
  bool get isFailure => _error != null;

  factory Result.failure(E error) {
    return Result<E, T>._(error, null);
  }

  factory Result.success(T data) {
    return Result<E, T>._(null, data);
  }

  R when<R>({required R Function(E error) failure, required R Function(T data) success}) {
    if (isFailure) {
      return failure(_error as E);
    }

    return success(_data as T);
  }
}

typedef ApiResult<E extends ApiFailureInfo, T> = Future<Result<E, T>>;

class ApiFailureInfo {
  final ApiFailureType type;
  final String? message;
  const ApiFailureInfo({required this.type, this.message});
}

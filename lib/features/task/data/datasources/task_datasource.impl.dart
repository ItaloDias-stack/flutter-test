import 'package:flutter_test_rafa/core/enums/api_failure_type.enum.dart';
import 'package:flutter_test_rafa/core/helpers/result.dart';
import 'package:flutter_test_rafa/core/http_communication/http_client_interface.dart';
import 'package:flutter_test_rafa/features/task/data/datasources/task_datasource.dart';
import 'package:flutter_test_rafa/features/task/data/model/task.model.dart';

class TaskDatasourceImpl extends TaskDatasource {
  final HttpClientInterface _httpClientinterface;

  TaskDatasourceImpl(this._httpClientinterface);

  @override
  Future<Result<ApiFailureInfo, List<TaskModel>>> getTasks({int? limit}) async {
    try {
      final response = await _httpClientinterface.get('/todos', queryParameters: {if (limit != null) '_limit': limit});

      if (response.data is List) {
        List<TaskModel> tasks = (response.data as List<dynamic>).map((element) => TaskModel.fromJson(element)).toList();
        return Result.success(tasks);
      }
      return Result.failure(const ApiFailureInfo(type: ApiFailureType.unknown, message: 'Format Error'));
    } catch (e) {
      return Result.failure(const ApiFailureInfo(type: ApiFailureType.server, message: 'Unavailable service'));
    }
  }
}

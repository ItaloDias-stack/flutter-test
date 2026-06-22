import 'package:flutter_test_rafa/core/helpers/result.dart';
import 'package:flutter_test_rafa/features/task/data/model/task.model.dart';

abstract class TaskDatasource {
  Future<Result<ApiFailureInfo, List<TaskModel>>> getTasks({int? limit});
}

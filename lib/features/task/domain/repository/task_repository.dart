import 'package:flutter_test_rafa/core/helpers/result.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';

abstract class TaskRepository {
  Future<Result<ApiFailureInfo, List<TaskEntity>>> getTasks(int? limit);
}

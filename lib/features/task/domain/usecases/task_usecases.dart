import 'package:flutter_test_rafa/core/helpers/result.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';
import 'package:flutter_test_rafa/features/task/domain/repository/task_repository.dart';

class TaskUsecases {
  final TaskRepository repository;
  TaskUsecases(this.repository);

  Future<Result<ApiFailureInfo, List<TaskEntity>>> getTasks(int? limit) => repository.getTasks(limit);
}

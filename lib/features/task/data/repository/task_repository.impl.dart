import 'package:flutter_test_rafa/core/helpers/result.dart';
import 'package:flutter_test_rafa/features/task/data/datasources/task_datasource.dart';
import 'package:flutter_test_rafa/features/task/data/mapper/task.mapper.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';
import 'package:flutter_test_rafa/features/task/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskDatasource datasource;

  TaskRepositoryImpl(this.datasource);

  @override
  Future<Result<ApiFailureInfo, List<TaskEntity>>> getTasks(int? limit) async {
    final response = await datasource.getTasks(limit: limit);
    if (response.isFailure) {
      return Result.failure(response.failure!);
    }
    return Result.success(response.data!.map(TaskMapper.toDomain).toList());
  }
}

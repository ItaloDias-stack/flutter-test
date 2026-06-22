import 'package:flutter_test_rafa/features/task/data/model/task.model.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';

class TaskMapper {
  static TaskEntity toDomain(TaskModel model) {
    return TaskEntity(userId: model.userId, id: model.id, title: model.title, completed: model.completed);
  }
}

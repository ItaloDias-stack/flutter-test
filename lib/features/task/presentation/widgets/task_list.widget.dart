import 'package:flutter/material.dart';
import 'package:flutter_test_rafa/core/routes/app_routes.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';
import 'package:flutter_test_rafa/features/task/presentation/widgets/task_container.widget.dart';

class TaskListWidget extends StatelessWidget {
  final List<TaskEntity> tasks;
  const TaskListWidget({super.key, required this.tasks});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return TaskComponent(task: tasks[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: tasks.length,
    );
  }
}

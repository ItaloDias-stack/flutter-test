import 'package:flutter/material.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';
import 'package:flutter_test_rafa/features/task/presentation/screens/task_detail.screen.dart';
import 'package:flutter_test_rafa/features/task/presentation/screens/task_list.screen.dart';

class AppRouting {
  static final routes = {
    AppRoutes.home: (_) => const TaskListScreen(),
    AppRoutes.taskDetail: (context) {
      final task = ModalRoute.of(context)!.settings.arguments as TaskEntity;
      return TaskDetailScreen(task: task);
    },
  };
}

class AppRoutes {
  static final String home = '/home';
  static final String taskDetail = '/task-detail';
}

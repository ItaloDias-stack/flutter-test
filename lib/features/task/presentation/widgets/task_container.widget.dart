import 'package:flutter/material.dart';
import 'package:flutter_test_rafa/core/routes/app_routes.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';

class TaskComponent extends StatelessWidget {
  final bool navigate;
  final TaskEntity task;
  const TaskComponent({super.key, required this.task, this.navigate = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigate) Navigator.pushNamed(context, AppRoutes.taskDetail, arguments: task);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [Text(task.title), _TaskStatusComponent(status: task.completed)],
        ),
      ),
    );
  }
}

class _TaskStatusComponent extends StatelessWidget {
  final bool status;
  const _TaskStatusComponent({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: status ? Colors.greenAccent.shade400 : Colors.redAccent.shade100,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: status ? Colors.green : Colors.red),
          ),
          Text(status ? 'Completed' : 'Not Completed', style: TextStyle(fontSize: 11, color: Colors.white)),
        ],
      ),
    );
  }
}

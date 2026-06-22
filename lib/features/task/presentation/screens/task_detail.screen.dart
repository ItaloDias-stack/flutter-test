import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_rafa/features/task/application/task_detail/task_detail.cubit.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';
import 'package:flutter_test_rafa/features/task/presentation/widgets/task_container.widget.dart';
import 'package:get_it/get_it.dart';

class TaskDetailScreen extends StatefulWidget {
  final TaskEntity task;
  const TaskDetailScreen({super.key, required this.task});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final cubit = GetIt.I.get<TaskDetailsCubit>();

  @override
  void initState() {
    cubit.setupTask(widget.task);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Details')),
      body: BlocSelector<TaskDetailsCubit, TaskDetailsState, TaskEntity?>(
        selector: (state) => state.selectedTask,
        bloc: cubit,
        builder: (context, task) {
          if (task == null) {
            return const SizedBox.shrink();
          }
          return TaskComponent(task: task);
        },
      ),
    );
  }
}

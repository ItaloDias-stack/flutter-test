import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_rafa/features/task/application/task_list/task_list.cubit.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';
import 'package:flutter_test_rafa/features/task/presentation/widgets/task_list.widget.dart';
import 'package:get_it/get_it.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final cubit = GetIt.I<TaskListCubit>();
  @override
  void initState() {
    cubit.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocSelector<TaskListCubit, TaskListState, (bool, List<TaskEntity>)>(
        selector: (state) => (state.isLoading, state.tasks),
        bloc: cubit,
        builder: (context, values) {
          bool isLoading = values.$1;
          List<TaskEntity> tasks = values.$2;
          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return TaskListWidget(tasks: tasks);
        },
      ),
    );
  }
}

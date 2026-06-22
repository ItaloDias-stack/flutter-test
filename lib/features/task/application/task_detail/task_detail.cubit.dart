import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';
part 'task_detail.state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit() : super(const TaskDetailsState());

  void setLoading(bool value) => emit(state.copyWith(isLoading: value));

  void setupTask(TaskEntity task) => emit(state.copyWith(selectedTask: task));
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_rafa/features/task/domain/entity/task.entity.dart';
import 'package:flutter_test_rafa/features/task/domain/usecases/task_usecases.dart';
part 'task_list.state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  final TaskUsecases _usecases;

  TaskListCubit(this._usecases) : super(const TaskListState());

  void setLoading(bool value) => emit(state.copyWith(isLoading: value));

  Future<void> getTasks() async {
    setLoading(true);

    final response = await _usecases.getTasks(20);

    response.when(
      failure: (error) {
        setLoading(false);
      },
      success: (data) {
        setLoading(false);
        emit(state.copyWith(tasks: data));
      },
    );
  }
}

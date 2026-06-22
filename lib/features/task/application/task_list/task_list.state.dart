part of 'task_list.cubit.dart';

class TaskListState extends Equatable {
  final bool isLoading;
  final List<TaskEntity> tasks;

  const TaskListState({this.isLoading = false, this.tasks = const []});

  TaskListState copyWith({bool? isLoading, List<TaskEntity>? tasks}) {
    return TaskListState(isLoading: isLoading ?? this.isLoading, tasks: tasks ?? this.tasks);
  }

  @override
  List<Object?> get props => [isLoading, tasks];
}

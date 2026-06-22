part of 'task_detail.cubit.dart';

class TaskDetailsState extends Equatable {
  final bool isLoading;
  final TaskEntity? selectedTask;

  const TaskDetailsState({this.isLoading = false, this.selectedTask});

  TaskDetailsState copyWith({bool? isLoading, TaskEntity? selectedTask}) {
    return TaskDetailsState(isLoading: isLoading ?? this.isLoading, selectedTask: selectedTask ?? this.selectedTask);
  }

  @override
  List<Object?> get props => [isLoading, selectedTask];
}

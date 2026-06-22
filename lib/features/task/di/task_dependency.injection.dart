import 'package:flutter_test_rafa/core/dependency_injection/injector.dart';
import 'package:flutter_test_rafa/features/task/application/task_detail/task_detail.cubit.dart';
import 'package:flutter_test_rafa/features/task/application/task_list/task_list.cubit.dart';
import 'package:flutter_test_rafa/features/task/data/datasources/task_datasource.dart';
import 'package:flutter_test_rafa/features/task/data/datasources/task_datasource.impl.dart';
import 'package:flutter_test_rafa/features/task/data/repository/task_repository.impl.dart';
import 'package:flutter_test_rafa/features/task/domain/repository/task_repository.dart';
import 'package:flutter_test_rafa/features/task/domain/usecases/task_usecases.dart';

class TaskDependencyInjection {
  static void configureTaskDependencyInjection(Injector injector) {
    injector.registerFactory<TaskDatasource>(() => TaskDatasourceImpl(injector.get()));

    injector.registerFactory<TaskRepository>(() => TaskRepositoryImpl(injector.get()));

    injector.registerFactory<TaskUsecases>(() => TaskUsecases(injector.get()));

    injector.registerFactory<TaskListCubit>(() => TaskListCubit(injector.get()));
    injector.registerFactory<TaskDetailsCubit>(() => TaskDetailsCubit());
  }
}

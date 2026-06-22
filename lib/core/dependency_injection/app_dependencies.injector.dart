import 'package:flutter_test_rafa/core/dependency_injection/get_it_injector.impl.dart';
import 'package:flutter_test_rafa/core/http_communication/dio_client.impl.dart';
import 'package:flutter_test_rafa/core/http_communication/dio_config.dart';
import 'package:flutter_test_rafa/core/http_communication/http_client_interface.dart';
import 'package:flutter_test_rafa/features/task/di/task_dependency.injection.dart';

final injector = GetItInjectorImpl();

Future<void> configureAppDependencies() async {
  final String baseUrl = const String.fromEnvironment('BASE_URL');
  injector.registerLazySingleton<HttpClientInterface>(() => DioClientImpl(DioConfig(baseUrl).dio));

  TaskDependencyInjection.configureTaskDependencyInjection(injector);
}

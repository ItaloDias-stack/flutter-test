import 'package:flutter/material.dart';
import 'package:flutter_test_rafa/core/dependency_injection/app_dependencies.injector.dart';
import 'package:flutter_test_rafa/my_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureAppDependencies();
  runApp(const MyMaterialApp());
}

import 'package:flutter/material.dart';
import 'package:flutter_test_rafa/core/routes/app_routes.dart';
import 'package:flutter_test_rafa/features/task/presentation/screens/task_list.screen.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: AppRouting.routes,
      home: const TaskListScreen(),
    );
  }
}

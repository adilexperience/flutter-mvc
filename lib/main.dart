import 'package:flutter/material.dart';
import 'package:flutter_mvc/controllers/task.dart';
import 'package:flutter_mvc/views/my_tasks.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskController>(
          create: (_) => TaskController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyTasks(),
    );
  }
}

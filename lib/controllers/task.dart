import 'package:flutter/material.dart';
import 'package:flutter_mvc/models/task.dart';

class TaskController extends ChangeNotifier {
  TextEditingController taskFieldController = TextEditingController();
  List<Task> tasks = [
    Task('Task 1', 'This is the first task', false),
    Task('Task 2', 'This is the second task', true),
  ];

  void addTask(Task task) {
    tasks.add(task);

    notifyListeners();
  }

  void toggleTask(Task task) {
    task.completed = !task.completed;

    notifyListeners();
  }
}

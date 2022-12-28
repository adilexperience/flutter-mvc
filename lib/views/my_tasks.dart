import 'package:flutter/material.dart';
import 'package:flutter_mvc/controllers/task.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';

class MyTasks extends StatelessWidget {
  const MyTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: SafeArea(
        child: Consumer<TaskController>(
          builder: (context, taskController, child) => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: taskController.tasks.length,
                  itemBuilder: (context, index) {
                    Task task = taskController.tasks[index];
                    return ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description),
                      leading: Checkbox(
                        value: task.completed,
                        onChanged: (value) {
                          taskController.toggleTask(task);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      decoration:
                          const InputDecoration(hintText: 'Add a new task'),
                      controller: taskController.taskFieldController,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String taskTitle =
                            taskController.taskFieldController.text.trim();
                        if (taskTitle.isNotEmpty) {
                          taskController.addTask(
                            Task(
                              taskController.taskFieldController.text.trim(),
                              '',
                              false,
                            ),
                          );
                        }
                      },
                      child: const Text("Add Task"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

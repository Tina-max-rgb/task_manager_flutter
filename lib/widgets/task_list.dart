import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        final tasks = taskData.tasks;
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskTile(task: task);
          },
        );
      },
    );
  }
}
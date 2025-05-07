import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/task_data.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'name') {
                taskData.sortTasksByName();
              } else if (value == 'status') {
                taskData.sortTasksByStatus();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'name',
                child: Text('Trier par nom'),
              ),
              const PopupMenuItem(
                value: 'status',
                child: Text('Trier par statut'),
              ),
            ],
          ),
        ],
      ),
      body: const TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const AddTaskScreen(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../data/task_data.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    if (_controller.text.trim().isEmpty) return;
    final newTask = Task(id: const Uuid().v4(), title: _controller.text.trim());
    Provider.of<TaskData>(context, listen: false).addTask(newTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Nouvelle tâche'),
            onSubmitted: (_) => _submit(),
          ),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Ajouter'),
          )
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class LocalStorageService {
  static const String taskKey = 'task_list';

  static Future<void> saveTasks(List<Task> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskJson = tasks.map((t) => json.encode(t.toJson())).toList();
    await prefs.setStringList(taskKey, taskJson);
  }

  static Future<List<Task>> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskJson = prefs.getStringList(taskKey);
    if (taskJson == null) return [];
    return taskJson.map((str) => Task.fromJson(json.decode(str))).toList();
  }
}

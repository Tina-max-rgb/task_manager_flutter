import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/local_storage_service.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  // Ajouter une tâche
  void addTask(Task task) {
    _tasks.add(task);
    saveTasks();
    notifyListeners();
  }

  // Cocher ou décocher une tâche
  void toggleTask(Task task) {
    task.toggleDone();
    saveTasks();
    notifyListeners();
  }

  // Supprimer une tâche
  void deleteTask(Task task) {
    _tasks.remove(task);
    saveTasks();
    notifyListeners();
  }

  // Charger les tâches depuis le stockage local
  Future<void> loadTasks() async {
    _tasks = await LocalStorageService.loadTasks();
    notifyListeners();
  }

  // Sauvegarder les tâches dans le stockage local
  void saveTasks() => LocalStorageService.saveTasks(_tasks);
  void sortTasksByStatus() {
  _tasks.sort((a, b) => a.isDone ? 1 : 0 - (b.isDone ? 1 : 0));
  notifyListeners(); // Met à jour l'interface utilisateur après le tri
}


  void sortTasksByName() {
    _tasks.sort((a, b) => a.title.compareTo(b.title));
    notifyListeners(); // Met à jour l'interface utilisateur après le tri
  }
  
}

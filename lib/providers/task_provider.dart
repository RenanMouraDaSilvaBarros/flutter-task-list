import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  final List<String> _listTask = [];

  List<String> get listTask => _listTask;

  taskIsValid(String value) {
    if (value.isEmpty) {
      return "campo vazio";
    }
  }

  void addTask(String task) {
    _listTask.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _listTask.removeAt(index);
    notifyListeners();
  }

  void editTask(int index, String updatedTask) {
    _listTask[index] = updatedTask;
    notifyListeners();
  }
}

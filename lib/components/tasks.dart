import 'package:flutter/material.dart';
import 'dart:core';

class Task {
  final String name;
  bool isDone;
  Task({this.name, this.isDone = false});
  toggleDone() {
    isDone = !isDone;
  }
}

class Tasks extends ChangeNotifier {
  List<Task> todo = [
    Task(name: "Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Buy yogurt"),
  ];

  int get len {
    return todo.length;
  }

  void addNewTask(String newTask) {
    todo.add(Task(name: newTask));
    notifyListeners();
  }

  void checkOff(Task chosen) {
    chosen.toggleDone();
    notifyListeners();
  }

  void remove(String taskName) {
    todo.removeWhere((item) => item.name == taskName);
    notifyListeners();
  }
}

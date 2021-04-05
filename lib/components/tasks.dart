import 'package:flutter/material.dart';
import 'dart:core';
// import 'package:cloud_firestore/cloud_firestore.dart';

// final _firestore = FirebaseFirestore.instance;

class Task {
  final String name;
  bool isDone;
  Task({this.name, this.isDone = false});
  toggleDone() {
    isDone = !isDone;
  }
}

class Tasks extends ChangeNotifier {
  List<Task> todo = [];

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

  void notify() {
    notifyListeners();
  }

  void removeTask(Task task) {
    todo.remove(task);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'taskTile.dart';
import 'package:provider/provider.dart';
import 'tasks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: tasks.todo[index].name,
              isChecked: tasks.todo[index].isDone,
              callbac: (cbState) {
                tasks.checkOff(tasks.todo[index]);
              },
              longCallbac: () {
                tasks.removeTask(tasks.todo[index]);
              },
            );
          },
          itemCount: tasks.todo.length,
        );
      },
    );
  }
}

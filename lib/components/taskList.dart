import 'package:flutter/material.dart';
import 'taskTile.dart';
import 'package:provider/provider.dart';
import 'tasks.dart';

class TaskList extends StatelessWidget {
  final String email;
  TaskList({this.email});
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: tasks.todo[index].name,
              // isChecked: tasks.todo[index].isDone,
              // callbac: (cbState) {
              //   tasks.checkOff(tasks.todo[index]);
              // },
              email: email,
            );
          },
          itemCount: tasks.todo.length,
        );
      },
    );
  }
}

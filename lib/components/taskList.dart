import 'package:flutter/material.dart';
import 'taskTile.dart';
import 'package:provider/provider.dart';
import 'tasks.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.todo[index].name,
              isChecked: taskData.todo[index].isDone,
              callbac: (cbState) {
                taskData.checkOff(taskData.todo[index]);
              },
              longCallbac: () {
                taskData.removeTask(taskData.todo[index]);
              },
            );
          },
          itemCount: taskData.todo.length,
        );
      },
    );
  }
}

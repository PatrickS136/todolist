import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/constants.dart';
import 'tasks.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function callbac;
  TaskTile({this.taskTitle, this.isChecked, this.callbac});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontFamily: "Oswald",
          letterSpacing: 2,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Checkbox(
        activeColor: darkgrey,
        value: isChecked,
        onChanged: callbac,
      ),
      onLongPress: () {
        Provider.of<Tasks>(context, listen: false).remove(taskTitle);
      },
    );
  }
}

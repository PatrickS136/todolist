import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class TaskTile extends StatelessWidget {
  // final _firestore = FirebaseFirestore.instance;
  final bool isChecked;
  final String taskTitle;
  final Function callbac;
  final Function longCallbac;
  final String email;
  TaskTile({
    this.taskTitle,
    this.isChecked,
    this.callbac,
    this.longCallbac,
    this.email,
  });
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
      onLongPress: longCallbac,
    );
  }
}

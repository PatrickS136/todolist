import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/components/tasks.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  // final bool isChecked;
  final String taskTitle;
  // final Function callbac;
  final String email;
  TaskTile({
    @required this.taskTitle,
    // @required this.isChecked,
    // @required this.callbac,
    @required this.email,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          // decoration: isChecked ? TextDecoration.lineThrough : null,
          fontFamily: "Oswald",
          letterSpacing: 2,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          Provider.of<Tasks>(context, listen: false).todo = [];
          Provider.of<Tasks>(context, listen: false)
              .todo
              .remove(Task(name: taskTitle));
          _firestore
              .collection(email)
              .doc(taskTitle)
              .delete()
              .then((value) => print("Task Deleted"))
              .catchError((error) => print("Failed to delete task: $error"));
          Provider.of<Tasks>(context, listen: false).notify();
        },
        icon: Icon(Icons.delete_forever),
      ),
      // onLongPress: () {
      //   Provider.of<Tasks>(context, listen: false).todo = [];
      //   Provider.of<Tasks>(context, listen: false)
      //       .todo
      //       .remove(Task(name: taskTitle));
      //   _firestore
      //       .collection(email)
      //       .doc(taskTitle)
      //       .delete()
      //       .then((value) => print("Task Deleted"))
      //       .catchError((error) => print("Failed to delete task: $error"));
      //   Provider.of<Tasks>(context, listen: false).notify();
      // },
    );
  }
}

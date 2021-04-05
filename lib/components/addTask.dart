import 'package:flutter/material.dart';
import 'tasks.dart';
import 'package:provider/provider.dart';
import 'package:todolist/constants.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String taskName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Add Task",
                style: TextStyle(
                  color: darkgrey,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                taskName = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Provider.of<Tasks>(context, listen: false).addNewTask(taskName);
                Navigator.pop(context);
              },
              autofocus: true,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Add",
                  style: TextStyle(color: grey, fontSize: 20),
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: darkgrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

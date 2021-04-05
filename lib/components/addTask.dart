import 'package:flutter/material.dart';
import 'tasks.dart';
import 'package:provider/provider.dart';
import 'package:todolist/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTask extends StatefulWidget {
  final String userEmail;
  AddTask({@required this.userEmail});
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _firestore = FirebaseFirestore.instance;
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
                Provider.of<Tasks>(context, listen: false).todo = [];
                _firestore
                    .collection('${this.widget.userEmail}')
                    .doc(taskName)
                    .set({
                  'taskName': taskName,
                  'createdAt': Timestamp.now(),
                  'isChecked': false,
                });
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

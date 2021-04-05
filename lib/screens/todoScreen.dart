import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks.dart';
import 'package:todolist/components/taskList.dart';
import 'package:todolist/components/addTask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final String toDoId = "/todo";

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  User loggedInUser;
  final _firestore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getTasks(loggedInUser.email);
  }

  void getTasks(String email) async {
    Provider.of<Tasks>(context, listen: false).todo = [];
    await for (var snapshots in _firestore
        .collection(email)
        .orderBy('createdAt', descending: false)
        .snapshots()) {
      for (var message in snapshots.docs) {
        print(message.data()["taskName"]);
        Provider.of<Tasks>(context, listen: false)
            .addNewTask(message.data()["taskName"]);
      }
    }
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTask(userEmail: loggedInUser.email),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: darkgrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 40, right: 20, bottom: 10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _auth.signOut();
                    print("Logging out");
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "$weekday, $day",
                  style: kDay,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      month,
                      style: kDay.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      year,
                      style: kDay.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Text(
                  "${Provider.of<Tasks>(context).len} task(s) remaining",
                  style: kSlogan,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: grey,
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks.dart';
import 'package:todolist/components/taskList.dart';
import 'package:todolist/components/addTask.dart';

final String toDoId = "/todo";

class ToDoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTask(),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: darkgrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 10),
            child: Row(
              children: [
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Text(
              "${Provider.of<Tasks>(context).len} task(s) remaining",
              style: kSlogan,
            ),
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

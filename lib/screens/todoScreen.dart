import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';

final String toDoId = "/todo";

class ToDoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "$weekday $day",
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

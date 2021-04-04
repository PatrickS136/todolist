import 'package:flutter/material.dart';
import 'package:todolist/screens/mainMenu.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TuDu',
      home: Scaffold(
        body: Container(
          color: grey,
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
          child: MainMenu(),
        ),
      ),
    );
  }
}

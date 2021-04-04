import 'package:flutter/material.dart';
import 'package:todolist/screens/mainMenu.dart';
import 'package:todolist/screens/login.dart';
import 'package:todolist/screens/register.dart';
import 'package:todolist/screens/todoScreen.dart';

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
      routes: {
        mainMenuId: (context) => MainMenu(),
        loginId: (context) => LoginScreen(),
        registerId: (context) => RegisterScreen(),
        toDoId: (context) => ToDoScreen(),
      },
      initialRoute: mainMenuId,
    );
  }
}

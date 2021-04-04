import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/components/reusableButton.dart';

final String registerId = "/register";

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Create your account!",
                  style: kLargeText,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 50,
              ),
              ReusableButton(
                onPressed: null,
                text: "Log in",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

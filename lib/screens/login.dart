import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/components/reusableButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todolist/screens/todoScreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final String loginId = "/login";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  final _auth = FirebaseAuth.instance;
  String password;
  bool spin = false;
  void setSpin() {
    setState(() {
      spin = !spin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: ModalProgressHUD(
        inAsyncCall: spin,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Welcome Back!",
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
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
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
                  onPressed: () async {
                    setSpin();
                    try {
                      UserCredential userCredential =
                          await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (userCredential != null) {
                        Navigator.pushNamed(context, toDoId);
                      }
                      setSpin();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  text: "Log in",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/components/reusableButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todolist/screens/todoScreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final String registerId = "/register";

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
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
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed((context), toDoId);
                      }
                      setSpin();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  text: "Register",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

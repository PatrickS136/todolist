import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/components/reusableButton.dart';
import 'login.dart';
import 'register.dart';

final String mainMenuId = '/';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.fact_check,
                  size: 130,
                  color: darkgrey,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TuDu",
                      style: kTitleStyle,
                    ),
                    Text(
                      "Enhancing productivity",
                      style: kSlogan,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ReusableButton(
              onPressed: () {
                Navigator.pushNamed(context, loginId);
              },
              text: "Log in",
            ),
            ReusableButton(
              onPressed: () {
                Navigator.pushNamed(context, registerId);
              },
              text: "Register",
            ),
          ],
        ),
      ),
    );
  }
}

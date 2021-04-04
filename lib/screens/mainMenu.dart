import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            Text(
              "TuDu",
              style: kTitleStyle,
            )
          ],
        ),
      ],
    );
  }
}

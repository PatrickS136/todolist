import 'package:flutter/material.dart';

DateTime currentDate = new DateTime.now();
String day = currentDate.day.toString();
String weekday = weekdays[currentDate.weekday - 1];
String month =
    months[currentDate.month - 1].toString().toUpperCase().substring(0, 3);
String year = currentDate.year.toString();

const Color black = Color.fromRGBO(34, 40, 49, 1);
const Color darkgrey = Color.fromRGBO(57, 62, 70, 1);
const Color yellow = Color.fromRGBO(255, 211, 105, 1);
const Color grey = Color.fromRGBO(238, 238, 238, 1);

const kTitleStyle = TextStyle(
  fontSize: 60,
  fontWeight: FontWeight.w600,
  letterSpacing: 4,
  fontFamily: "Oswald",
  color: darkgrey,
);

const kButtonText = TextStyle(
  color: grey,
  fontSize: 20,
  letterSpacing: 4,
  fontFamily: "Oswald",
  fontWeight: FontWeight.w700,
);

const kSlogan = TextStyle(
  color: darkgrey,
  fontFamily: "Oswald",
  fontSize: 20,
);

const kDay = TextStyle(
  color: darkgrey,
  fontSize: 30,
  fontFamily: "Oswald",
);

const kLargeText = TextStyle(
  fontSize: 60,
  fontWeight: FontWeight.w800,
  letterSpacing: 4,
  fontFamily: "Oswald",
);

const List<String> weekdays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

const List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(28.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: darkgrey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(28.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(28.0)),
  ),
);

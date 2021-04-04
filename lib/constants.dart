import 'package:flutter/material.dart';

DateTime currentDate = new DateTime.now();
String day = currentDate.day.toString();
String month = currentDate.month.toString();
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

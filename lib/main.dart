import 'package:calculator_app/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalcusApp());
}

class CalcusApp extends StatelessWidget {
  const CalcusApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

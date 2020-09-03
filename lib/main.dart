import 'package:flutter/material.dart';

import 'InputPage.dart';

void main() {
  runApp(BMI_App());
}

// ignore: camel_case_types
class BMI_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ),
        home: InputPage());
  }
}

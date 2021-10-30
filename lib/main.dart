import 'package:flutter/material.dart';
import 'header.dart';
import 'constants.dart';

void main() {
  runApp(const MyBMI());
}

class MyBMI extends StatelessWidget {
  const MyBMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF396a7e),
        scaffoldBackgroundColor: kPrimaryBmiBackground,
      ),
      home: BMIScreen(),
    );
  }
}

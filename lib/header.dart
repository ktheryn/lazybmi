import 'constants.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';


class BMIScreen extends StatelessWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('BMI CALCULATOR'),
        backgroundColor: kPrimaryBmiAddonTwo,
      ),
      //body: AppBarExtension(),
      body: AppBarExtensionTwo(),
    );
  }
}

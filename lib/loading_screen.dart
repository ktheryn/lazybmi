
import 'package:flutter/material.dart';
import 'home_screen_v2.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BMIScreenV2()), (Route<dynamic> route) => false);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/BMIIconLogo.png',
                height: (MediaQuery.of(context).size.width)*0.85,
                width: (MediaQuery.of(context).size.width)*0.85,
              ),
            ],
          ),
        ],
      ),
    );;
  }
}

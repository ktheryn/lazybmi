import 'package:flutter/cupertino.dart';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: kPrimaryBmiSlider,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.save, color: Colors.white),
            backgroundColor: kPrimaryBmiSlider,
            labelWidget: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.0),color: Colors.white,),
              margin: EdgeInsets.only(right: 0),
              padding: EdgeInsets.all(5.0),
              child: Text('Save',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          SpeedDialChild(
            child: Icon(Icons.library_books, color: Colors.white),
            backgroundColor: kPrimaryBmiSlider,
            onTap: (){
              print("instant feedback working!");
            },
            labelWidget: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.0),color: Colors.white,),
              margin: EdgeInsets.only(right: 0),
              padding: EdgeInsets.all(5.0),
              child: Text('List BMI',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}

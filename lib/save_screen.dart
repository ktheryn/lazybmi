import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

class SaveScreen extends StatefulWidget {
  SaveScreen({required this.bmirlist, required this.bmislist});

  final List bmislist;
  final List bmirlist;

  @override
  _SaveScreenState createState() => _SaveScreenState(bmiscoredlist:bmislist,bmiresuldtslist:bmirlist);
}

class _SaveScreenState extends State<SaveScreen> {

  _SaveScreenState({required this.bmiresuldtslist, required this.bmiscoredlist});

  List bmiscoredlist;
  List bmiresuldtslist;

  saveStringToSF(List<String> value) async {
    print("Task List : $value");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('stringValue', value);
  }

  saveStringToSF2(List<String> value2) async {
    print("Task List2 : $value2");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('stringValue2', value2);
  }

  bmiResultTextColor(String resultText){
    if(resultText == 'Obesity III'){
      return Colors.red[900];
    } else if(resultText == 'Obesity II'){
      return Colors.red[700];
    } else if(resultText == 'Obesity I'){
      return Colors.red;
    } else if(resultText == 'Overweight'){
      return Colors.red[400];
    } else if(resultText == 'Normal'){
      return Colors.green;
    } else if(resultText == 'Underweight'){
      return Colors.blue;
    }
  }

  bmiResultIcon(String resultText){
    if(resultText == 'Obesity III'){
      return Icons.error_outline_sharp;
    } else if(resultText == 'Obesity II'){
      return Icons.error_outline_sharp;
    } else if(resultText == 'Obesity I'){
      return Icons.error_outline_sharp;
    } else if(resultText == 'Overweight'){
      return Icons.error_outline_sharp;
    } else if(resultText == 'Normal'){
      return Icons.thumb_up_alt_sharp;
    } else if(resultText == 'Underweight'){
      return Icons.flatware;
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF396a7e),
        backgroundColor: kPrimaryBmiBackground,
        scaffoldBackgroundColor: Color(0xFFeedfca),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('BMI CALCULATOR'),
          backgroundColor: kPrimaryBmiAddonTwo,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount: bmiscoredlist.length,itemBuilder: (context, index){
                return Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: (MediaQuery.of(context).size.width)*0.02,),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(bmiscoredlist[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35.0),),
                            SizedBox(height: (MediaQuery.of(context).size.height)*0.02,),
                            Row(
                              children: <Widget>[
                                Icon(bmiResultIcon(bmiresuldtslist[index]),color: Colors.white,),
                                SizedBox(width: 5,),
                                Text(bmiresuldtslist[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.white),),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(width: 7,),
                                Text("Saved Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                              ],
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: (MediaQuery.of(context).size.height)*0.02,),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  bmiscoredlist.removeAt(index);
                                  bmiresuldtslist.removeAt(index);
                                  saveStringToSF(List<String>.from(bmiscoredlist));
                                  saveStringToSF2(List<String>.from(bmiresuldtslist));
                                  print("Deleted");
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.delete_forever),
                                  SizedBox(width: 5,),
                                  Text("Delete",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  decoration: BoxDecoration(
                    color: bmiResultTextColor(bmiresuldtslist[index]),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 130.0,
                );
                //   ListTile(
                //   title: Text(bmiscoredlist[index], style: const TextStyle(color: Colors.black)),
                //   subtitle: Text(bmiresuldtslist[index], style: const TextStyle(color: Colors.black)),
                // );
              }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

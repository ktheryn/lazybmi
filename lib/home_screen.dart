import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'reusable.dart';
import 'calculator.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'save_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarExtensionTwo extends StatefulWidget {
  const AppBarExtensionTwo({Key? key}) : super(key: key);

  @override
  State<AppBarExtensionTwo> createState() => _AppBarExtensionTwoState();
}

class _AppBarExtensionTwoState extends State<AppBarExtensionTwo> {
  double _height = 180;
  double _weight = 60;
  String BMIscore = '18.1';
  String BMIresults = 'NORMAL';
  String BMIText = "You have a normal body weight. Good job!";
  List<String> bmiscorelist = [];
  List<String> bmiresultlist = [];
  final GlobalKey _parentKey = GlobalKey();

  void addtolist(String value, String value2) {
    setState(() {
      bmiscorelist.add(value);
      bmiresultlist.add(value2);
    });
  }

  void getToggle(index) {
    if (index == 0) {
      index == 0;
    } else {
      _onAlertButtonsPressed(context);
    }
  }

  saveStringToSF(List<String> value) async {
    print("Task List : $value");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('stringValue', value);
  }

  Future<List<String>?> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('stringValue');
  }

  saveStringToSF2(List<String> value2) async {
    print("Task List2 : $value2");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('stringValue2', value2);
  }

  Future<List<String>?> getStringValuesSF2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('stringValue2');
  }

  @override
  void initState() {
    super.initState();
    getStringValuesSF().then((value) {
      setState(() {
        bmiscorelist = value!;
      });
    });
    getStringValuesSF2().then((value2) {
      setState(() {
        bmiresultlist = value2!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Column(
      children: [
        Container(
          height: size.height * 0.08,
          child: Container(
            padding: kpaddingstyle3,
            decoration: const BoxDecoration(
              color: kPrimaryBmiAddonTwo,
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.elliptical(100, 30)),
            ),
            child: Row(
              children: [
                Text(
                  'Hello, Good Day!',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const Spacer(),
                const CircleAvatar(
                  backgroundImage: AssetImage('images/bmi.png'),
                  radius: 25.0,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: kpaddingstyle2,
          child: Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Weight in Kg',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const Spacer(),
              ToggleSwitch(
                  minWidth: 60.0,
                  minHeight: 30,
                  cornerRadius: 20.0,
                  activeBgColors: const [
                    [kPrimaryBmiSlider],
                    [kPrimaryBmiSlider]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: const ['Metric', 'English'],
                  radiusStyle: true,
                  onToggle: (index) {
                    getToggle(index);
                  }),
            ],
          ),
        ),
        Padding(
          padding: kpaddingstyle,
          child: Row(
            children: [
              Padding(
                padding: kpaddingdumbells,
                child: Row(
                  children: [
                    Reusable_dumbells(
                      heightdumbells: 30,
                    ),
                    Reusable_dumbells(
                      heightdumbells: 50,
                    ),
                    Reusable_dumbells(
                      heightdumbells: 60,
                    ),
                    Reusable_dumbells(
                      heightdumbells: 80,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        _weight.toStringAsFixed(1) + ' kg',
                        style: const TextStyle(
                            fontSize: 22.0,
                            color: kPrimaryBmiSlider,
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    SfSlider(
                        min: 40,
                        max: 200,
                        interval: 40,
                        stepSize: 0.1,
                        showTicks: true,
                        showDividers: true,
                        showLabels: true,
                        value: _weight,
                        onChanged: (dynamic weight) {
                          setState(() {
                            _weight = weight;
                          });
                        }),
                  ],
                ),
              ),
              Padding(
                padding: kpaddingdumbells,
                child: Row(
                  children: [
                    Reusable_dumbells(
                      heightdumbells: 80,
                    ),
                    Reusable_dumbells(
                      heightdumbells: 60,
                    ),
                    Reusable_dumbells(
                      heightdumbells: 50,
                    ),
                    Reusable_dumbells(
                      heightdumbells: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: kpaddingstyle2,
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Height in Cm',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset('images/bmielephant.png')),
              SfSlider.vertical(
                  min: 120,
                  max: 200,
                  interval: 10,
                  stepSize: 0.1,
                  showDividers: true,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 1,
                  value: _height,
                  onChanged: (dynamic height) {
                    setState(() {
                      _height = height;
                    });
                  }),
              //SizedBox(width: 10.0),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      _height.toStringAsFixed(1) + ' cm',
                      style: const TextStyle(
                          fontSize: 22.0,
                          color: kPrimaryBmiSlider,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
              ),
              Expanded(
                child: Padding(
                  padding:  kpaddingstyle4,
                  child: Table(
                    border: TableBorder.all(style: BorderStyle.solid, color: kPrimaryBmiSlider, width: 1.5),
                    children: const [
                      TableRow(children: [
                        Text(
                          'Classification', style: TextStyle(color: Color(0xFF396a7e), fontSize: 13, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,
                        ),
                        Text('BMI (kg/m\u00B2)', style: TextStyle(color: Color(0xFF396a7e), fontSize: 13, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
                      ]),
                      TableRow(children: [
                        Text('Underweight', style: TextStyle(color: Color(0xFF396a7e), fontSize: 14), textAlign: TextAlign.center,),
                        Text('<18.5', style: kltablelabelstyle2, textAlign: TextAlign.center,),
                      ]),
                      TableRow(children: [
                        Text('Normal', style: TextStyle(color: Color(0xFF396a7e), fontSize: 14), textAlign: TextAlign.center,),
                        Text('18.5-24.9', style: kltablelabelstyle2, textAlign: TextAlign.center,),
                      ]),
                      TableRow(children: [
                        Text('Overweight', style: TextStyle(color: Color(0xFF396a7e), fontSize: 14), textAlign: TextAlign.center,),
                        Text('25-29.9', style: kltablelabelstyle2, textAlign: TextAlign.center,),
                      ]),
                      TableRow(children: [
                        Text('Obesity I', style: TextStyle(color: Color(0xFF396a7e), fontSize: 14), textAlign: TextAlign.center,),
                        Text('30-34.9', style: kltablelabelstyle2, textAlign: TextAlign.center,),
                      ]),
                      TableRow(children: [
                        Text('Obesity II', style: TextStyle(color: Color(0xFF396a7e), fontSize: 14), textAlign: TextAlign.center,),
                        Text('35-39.9', style: kltablelabelstyle2, textAlign: TextAlign.center,),
                      ]),
                      TableRow(children: [
                        Text('Obesity III', style: TextStyle(color: Color(0xFF396a7e), fontSize: 14), textAlign: TextAlign.center,),
                        Text('>40', style: kltablelabelstyle2, textAlign: TextAlign.center,),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: kpaddingstyle,
          alignment: Alignment.topLeft,
          height: size.height * 0.20,
          width: size.width,
          decoration: const BoxDecoration(
            color: kPrimaryBmiAddonTwo,
            borderRadius:
                BorderRadius.only(topRight: Radius.elliptical(100, 30)),
          ),
          child: Stack(
            overflow: Overflow.visible,
            fit: StackFit.expand,
            children: [
              Positioned(
                right: 0,
                left: size.width * 0.7,
                bottom: 90,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      calculator calc =
                          calculator(height: _height, weight: _weight);
                      BMIscore = calc.calculateBMI();
                      BMIresults = calc.getResult();
                      BMIText = calc.getInterpretation();
                      // addtolist(BMIscore, BMIresults);
                      // saveStringToSF(bmiscorelist);
                      // saveStringToSF2(bmiresultlist);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SaveScreen(
                      //               bmislist: bmiscorelist,
                      //               bmirlist: bmiresultlist,
                      //             )));
                    });
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Stack(
                      //alignment: Alignment.center,
                      children: [
                        Image.asset('images/applen.png'),
                        const Center(
                            child: Text(
                          "Calculate",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ],
                    ),
                  ),
                  // child: Container(
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     'Calculate',
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  //   width: 50,
                  //   height: 80,
                  //   decoration: BoxDecoration(
                  //     color: kPrimaryBmiAddonOne,
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.elliptical(70, 20),
                  //       topRight: Radius.elliptical(50, 20),
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Your BMI',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(BMIscore, style: klbottomlabelstyle2),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('$BMIresults ', style: klbottomlabelstyle2),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      BMIText,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      content: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Weight: lb',
                        labelStyle: klabelstyle,
                        hintText: 'ex. 132.2',
                        hintStyle: TextStyle(color: Colors.black54),
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height: ft & inch',
                      hintText: 'ex. 61.0',
                      hintStyle: TextStyle(color: Colors.black54),
                      labelStyle: klabelstyle,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      title: "Input weight & height",
      style: const AlertStyle(titleStyle: TextStyle(color: Color(0xFF396a7e), fontSize: 25, fontWeight: FontWeight.bold,)),
      buttons: [
        DialogButton(
          radius: BorderRadius.all(Radius.circular(20)),
          child: const Text(
            "Calculate",
            style: TextStyle(color: Color(0xFF396a7e), fontSize: 18,fontWeight: FontWeight.bold,),
          ),
          onPressed: () => setState(() {
            calculator calc = calculator(height: _height, weight: _weight);
            BMIscore = calc.calculateBMI2();
            BMIresults = calc.getResult();
            BMIText = calc.getInterpretation();
            addtolist(BMIscore, BMIresults);
            saveStringToSF(bmiscorelist);
            saveStringToSF2(bmiresultlist);
            Navigator.pop(context);
          }),
          color: Colors.white,
        ),
        DialogButton(
          radius: BorderRadius.all(Radius.circular(20)),
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold,),
          ),
          onPressed: () => setState(() {
            calculator calc = calculator(height: _height, weight: _weight);
            BMIscore = calc.calculateBMI2();
            BMIresults = calc.getResult();
            BMIText = calc.getInterpretation();
            addtolist(BMIscore, BMIresults);
            saveStringToSF(bmiscorelist);
            saveStringToSF2(bmiresultlist);
            Navigator.pop(context);
          }),
          color: kPrimaryBmiSlider,
        )
      ],
    ).show();
  }
}

import 'dart:math';
import 'dart:convert';

class calculator {
  calculator({required this.height, required this.weight});

  final double height;
  final double weight;

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }


  String calculateBMI2() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }


  bool getColor() {
    if (_bmi >= 40) {
      return true;
    } else if (_bmi >= 35) {
      return true;
    } else if (_bmi >= 30) {
      return true;
    } else if (_bmi >= 30) {
      return true;
    } else if (_bmi >= 25) {
      return true;
    } else if (_bmi >= 18) {
      return false;
    } else {
      return true;
    }
  }


  String getResult()  {
    if (_bmi >= 40) {
      return 'Obesity III';
    } else if (_bmi >= 35) {
      return 'Obesity II';
    } else if (_bmi >= 30) {
      return 'Obesity I';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }


  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }


}


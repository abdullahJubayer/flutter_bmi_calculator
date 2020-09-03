import 'dart:math';

import 'package:flutter/cupertino.dart';

class BmiBrain {
  final int height;
  final int weight;
  double _bmi;
  BmiBrain({@required this.height, @required this.weight});

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "OverWeight";
    } else if (_bmi >= 18) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getSuggestion() {
    if (_bmi >= 25) {
      return "You have a higher then Normal body weight.Try to Exercise more";
    } else if (_bmi >= 18) {
      return "You have Normal body weight.good Job";
    } else {
      return "You have a lower body weight.Eit little bit more";
    }
  }
}

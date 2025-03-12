import 'dart:html';

import 'package:co2emisson/Electricity/bargraph/individualbar.dart';
import 'package:flutter/material.dart';

class Bardata {
  final double sunamount;
  final double sunamount1;
  final double sunamount2;
  final double sunamount3;
  final double sunamount4;
  final double sunamount5;
  Bardata({
    required this.sunamount,
    required this.sunamount1,
    required this.sunamount2,
    required this.sunamount3,
    required this.sunamount4,
    required this.sunamount5,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunamount),
      IndividualBar(x: 0, y: sunamount2),
      IndividualBar(x: 0, y: sunamount1),
      IndividualBar(x: 0, y: sunamount3),
      IndividualBar(x: 0, y: sunamount4),
      IndividualBar(x: 0, y: sunamount5),
    ];
  }
}

import 'package:co2emisson/Electricity/bargraph/bardata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBar_graph extends StatelessWidget {
  List Summary;

  MyBar_graph({super.key, required this.Summary});

  @override
  Widget build(BuildContext context) {
    //initialize bar data

    Bardata MyBardata = Bardata(
      sunamount: Summary[0],
      sunamount1: Summary[1],
      sunamount2: Summary[2],
      sunamount3: Summary[4],
      sunamount4: Summary[5],
      sunamount5: Summary[6],
    );
    MyBardata.initializeBarData();

    return BarChart(BarChartData(
      maxY: 100,
      minY: 0,
      barGroups: MyBardata.barData
          .map((data) => BarChartGroupData(
                x: data.x,
                barRods: [BarChartRodData(toY: data.y)],
              ))
          .toList(),
    ));
  }
}

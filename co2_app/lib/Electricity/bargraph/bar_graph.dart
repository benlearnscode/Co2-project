import '/Electricity/bargraph/bardata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBar_graph extends StatelessWidget {
  final List weeklySummary;

  MyBar_graph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    //initialize bar data

    Bardata MyBardata = Bardata(
      sunamount: weeklySummary[0],
      sunamount1: weeklySummary[1],
      sunamount2: weeklySummary[2],
      sunamount3: weeklySummary[3],
      sunamount4: weeklySummary[4],
      sunamount5: weeklySummary[5],
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

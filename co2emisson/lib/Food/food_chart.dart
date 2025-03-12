import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FoodData {
  FoodData(this.date, this.co2);

  final String date;
  final double co2;
}

class FoodChart extends StatefulWidget {
  final List<FoodData> fooddataco2;
  const FoodChart({
    Key? key,
    required this.fooddataco2,
  }) : super(key: key);

  @override
  FoodChartState createState() => FoodChartState();
}

class FoodChartState extends State<FoodChart> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
        tooltipBehavior: _tooltip,
        series: [
          BubbleSeries<FoodData, String>(
              dataSource: widget.fooddataco2,
              xValueMapper: (FoodData data, _) => data.date,
              yValueMapper: (FoodData data, _) => data.co2,
              name: 'Gold',
              color: Colors.blue)
        ]);
  }
}

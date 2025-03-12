import 'package:co2emisson/Electricity/bargraph/bar_graph.dart';
import 'package:co2emisson/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElectrcityHome extends StatefulWidget {
  static const routeName = "ElectrcityHome";
  const ElectrcityHome({super.key});

  @override
  State<ElectrcityHome> createState() => _ElectrcityHomeState();
}

class _ElectrcityHomeState extends State<ElectrcityHome> {
  List<double> weeklySummary = [4.40, 2.40, 42.42, 10.5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Electricity Consumption"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
                height: 350,
                child: MyBar_graph(
                  Summary: weeklySummary,
                ))
          ],
        ),
      ),
    );
  }
}

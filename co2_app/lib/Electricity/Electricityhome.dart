import 'package:co2_app/Electricity/addelectricity.dart';
import 'package:fl_chart/fl_chart.dart';

import '/Electricity/bargraph/bar_graph.dart';
import '/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'addelectricity.dart';

class ElectrcityHome extends StatefulWidget {
  static const routeName = "ElectrcityHome";
  const ElectrcityHome({super.key});

  @override
  State<ElectrcityHome> createState() => _ElectrcityHomeState();
}

class _ElectrcityHomeState extends State<ElectrcityHome> {
  List<double> weeklySummary = [4.40, 2.40, 42.42, 10.5, 8.92, 5.22];
  late List blocks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Electricity Consumption"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Total electricity consumption history :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.all(20),
                height: 350,
                child: MyBar_graph(
                  weeklySummary: weeklySummary,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Total electricity consumption Block-wise :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              child: PieChart(
                  swapAnimationDuration: Duration(milliseconds: 150),
                  PieChartData(
                    centerSpaceRadius: 80,
                    sectionsSpace: 5,
                    sections: [
                      PieChartSectionData(
                        title: "St.paul",
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        value: 20,
                        color: Color.fromARGB(255, 56, 118, 224),
                      ),
                      PieChartSectionData(
                        title: "admin block",
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        value: 20,
                        color: Color.fromARGB(255, 15, 172, 54),
                      ),
                      PieChartSectionData(
                        title: "auditorium",
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        value: 50,
                        color: Color.fromARGB(255, 215, 27, 203),
                      ),
                      PieChartSectionData(
                        title: "specilization block",
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        value: 50,
                        color: Color.fromARGB(255, 92, 103, 149),
                      ),
                      PieChartSectionData(
                        title: "block 1",
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        value: 20,
                        color: Color.fromARGB(255, 210, 26, 38),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Total electricity consumption Block-wise :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddElectricityDataPage()));
                },
                child: Text('Add Food Waste'),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

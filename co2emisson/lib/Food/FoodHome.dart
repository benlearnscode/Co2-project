import 'dart:convert';

import 'package:co2emisson/Food/foodinsertion.dart';
import 'package:co2emisson/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/foodmodel.dart';
import 'food_chart.dart';

class FoodHome extends StatefulWidget {
  static const routeName = "FoodHome";
  const FoodHome({super.key});

  @override
  State<FoodHome> createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  List<FoodData> foodmodeldata = [];
  Future<void> fetchData() async {
    foodmodeldata = [];
    try {
      var url = mainurl+'/api/foodwaste';
      var response = await http.get(Uri.parse(url));

      var data = json.decode(response.body) as List<dynamic>;
      data.forEach((e) {
        var fooddata = e as Map<String, dynamic>;
        print(fooddata);
        FoodData t = FoodData(
          fooddata['date'].toString().substring(8, 10),
          fooddata['tonsofwaste'] * 0.5,
        );
        foodmodeldata.add(t);
        // co2ValuesList.add(fooddata['tonsofwaste'] * 0.5);
      });
      print(foodmodeldata.length);
      setState(() {
        foodmodeldata = foodmodeldata;
      });
      print(response.body.runtimeType);
    } catch (e) {
      print("Error is $e");
    }

    print("******************************************");
    print(foodmodeldata);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0.9,
        title: Text("Food Wastage",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                "Food wastage as per Days:",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
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
                        title: "Dumping",
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        value: 20,
                        color: Color.fromARGB(255, 56, 118, 224),
                      ),
                      PieChartSectionData(
                        title: "vermi-compost",
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        value: 20,
                        color: Color.fromARGB(255, 15, 172, 54),
                      ),
                      PieChartSectionData(
                        title: "Bio-dumping",
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        value: 50,
                        color: Color.fromARGB(255, 210, 26, 38),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                  "Distribution of source of food wastage segration process"),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                "Food wastage as per Days:",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              height: 300,
              child: FoodChart(
                fooddataco2: foodmodeldata,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                "To Add food wastage ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FoodInsertion()));
                },
                child: Text('Add Food Waste'),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

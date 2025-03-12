import 'dart:convert';

import 'package:co2emisson/Constant/api.dart';
import 'package:co2emisson/Food/addfoodwaste.dart';
import 'package:co2emisson/Food/foodcontainer.dart';
import 'package:co2emisson/Models/foodmodel.dart';
import 'package:co2emisson/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FoodInsertion extends StatefulWidget {
  const FoodInsertion({super.key});

  @override
  State<FoodInsertion> createState() => _FoodInsertionState();
}

class _FoodInsertionState extends State<FoodInsertion> {
  // Client client = http.Client() as Client;

  @override
  void initState() {
    fetchData();

    super.initState();
  }

  List<foodmodel> foodmodeldata = [];
  List<double> co2ValuesList = [];
  bool isloadind = true;
  void fetchData() async {
    foodmodeldata = [];
    try {
      var url = mainurl + '/api/foodwaste';
      var response = await http.get(Uri.parse(url));

      var data = json.decode(response.body) as List<dynamic>;
      data.forEach((e) {
        var fooddata = e as Map<String, dynamic>;
        print(fooddata);
        foodmodel t = foodmodel(
          tonsofwaste: fooddata['tonsofwaste'],
          co2: fooddata['tonsofwaste'] * 0.5,
          date: fooddata['date'],
        );
        foodmodeldata.add(t);
        // co2ValuesList.add(fooddata['tonsofwaste'] * 0.5);
      });
      print(foodmodeldata.length);
      setState(() {
        foodmodeldata = foodmodeldata;
        co2ValuesList = co2ValuesList;
        isloadind = false;
      });
      print(response.body.runtimeType);
    } catch (e) {
      print("Error is $e");
    }

    for (int i = 0; i < co2ValuesList.length; i++) {
      print(co2ValuesList[i]);
    }
    // notes=[];
    // List respinse = jsonDecode( client.get(retriveUrl).body );
    print("Hello.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text("Food Waste Insertion"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, bottom: 15),
            child: Text(
              "Food Waste entriees :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView(
                children: foodmodeldata
                    .map((e) => foodcontainer(
                          ofood: e,
                        ))
                    .toList(),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddFoodWastePage()),
                    );
                    fetchData();
                  },
                  child: Text('Add Food Waste'),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

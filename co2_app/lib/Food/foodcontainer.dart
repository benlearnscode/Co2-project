import '/Models/foodmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class foodcontainer extends StatelessWidget {
  final foodmodel ofood;

  foodcontainer({
    super.key,
    required this.ofood,
  });

  @override
  Widget build(BuildContext context) {
    double progress = ofood.tonsofwaste / 100;
    String formattedDate =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(ofood.date));

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'date : $formattedDate \n'
            'Tons of Waste: ${ofood.tonsofwaste}',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            'Co2 : ${ofood.co2}',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
    );
  }
}

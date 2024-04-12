import 'package:flutter/material.dart';

class ElectricityInsertion extends StatefulWidget {
  const ElectricityInsertion({super.key});

  @override
  State<ElectricityInsertion> createState() => _ElectricityInsertionState();
}

class _ElectricityInsertionState extends State<ElectricityInsertion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            decoration:
                InputDecoration(hintText: "kwh", border: OutlineInputBorder()),
          )
        ]),
      ),
    );
  }
}

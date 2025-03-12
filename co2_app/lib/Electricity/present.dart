import 'package:flutter/material.dart';
import 'apiservie.dart'; // Import the ApiService class

class ElectricityConsumptionPage extends StatefulWidget {
  @override
  _ElectricityConsumptionPageState createState() =>
      _ElectricityConsumptionPageState();
}

class _ElectricityConsumptionPageState
    extends State<ElectricityConsumptionPage> {
  List<int> months = [];
  List<int> wattofelectricity = [];
  List<String> blocks = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Call fetchData when the widget initializes
  }

  Future<void> fetchData() async {
    try {
      var result = await ApiService.fetchData();
      setState(() {
        months = List<int>.from(result['months']);
        wattofelectricity = List<int>.from(result['wattofelectricity']);
        blocks = List<String>.from(result['blocks']);
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error (e.g., show error message)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Electricity Consumption'),
        ),
        body: ListView.builder(
          itemCount: months.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Month: ${months[index]}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Watts of Electricity: ${wattofelectricity[index]}'),
                  Text('Block: ${blocks[index]}'),
                ],
              ),
            );
          },
        ));
  }
}

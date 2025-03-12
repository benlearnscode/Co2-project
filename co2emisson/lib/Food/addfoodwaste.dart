import 'package:co2emisson/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AddFoodWastePage extends StatefulWidget {
  const AddFoodWastePage({Key? key}) : super(key: key);

  @override
  _AddFoodWastePageState createState() => _AddFoodWastePageState();
}

class _AddFoodWastePageState extends State<AddFoodWastePage> {
  TextEditingController tonsOfWasteController = TextEditingController();
  TextEditingController typeofwasteController = TextEditingController();
  Future<void> addFoodWaste() async {
    String tonsOfWaste = tonsOfWasteController.text;
    String typeofwaste = typeofwasteController.text;
    var url = mainurl + '/api/foodwaste/';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'tonsofwaste': tonsOfWaste,
        'methodofwaste': typeofwaste,
      },
    );

    if (response.statusCode == 201) {
      // Successful insertion
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Food waste added successfully')),
      );
      if (mounted) Navigator.of(context).pop();
    } else {
      // Handle insertion failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add food waste')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Food Waste')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: tonsOfWasteController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tons of Waste'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: addFoodWaste,
              child: Text('Add Food Waste'),
            ),
            TextField(
              // controller: typeofwasteController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: 'Type of decompostion'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: addFoodWaste,
              child: Text('Submit your Type'),
            ),
          ],
        ),
      ),
    );
  }
}

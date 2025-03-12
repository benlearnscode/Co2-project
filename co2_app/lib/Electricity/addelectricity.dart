import 'dart:convert';
import '/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddElectricityDataPage extends StatefulWidget {
  const AddElectricityDataPage({Key? key}) : super(key: key);

  @override
  _AddElectricityDataPageState createState() => _AddElectricityDataPageState();
}

class _AddElectricityDataPageState extends State<AddElectricityDataPage> {
  TextEditingController wattofelectricityController = TextEditingController();
  // TextEditingController blocknameController = TextEditingController();
  String? selectedBlock;

  List<String> blocks = [
    'St.paul',
    'admin block',
    'block 1',
    'block 2',
    'block 3',
    'block 4',
    'block 5',
    'block 6',
    'block 7',
    'block 8',
    'auditorium',
    'specilization block'
  ];

  Future<void> postData() async {
    String wattofelectricity = wattofelectricityController.text;
    // String blockname = blocknameController.text;
    var url = Uri.parse(mainurl+'/api/electricity/');

    var response = await http.post(
      url,
      body: {
        'wattofelectricity': wattofelectricity,
        'blockname': selectedBlock,
      },
      // headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // Data posted successfully
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Data posted successfully!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Error posting data
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to post data!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Electricity Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: wattofelectricityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Watts of Electricity'),
            ),
            SizedBox(height: 16),
            // TextField(
            //   controller: blocknameController,
            //   keyboardType: TextInputType.name,
            //   decoration: InputDecoration(labelText: 'Block Name'),
            // ),
            DropdownButtonFormField<String>(
              value: selectedBlock,
              items: blocks.map((block) {
                return DropdownMenuItem<String>(
                  value: block,
                  child: Text(block),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBlock = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Block Name',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: postData,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

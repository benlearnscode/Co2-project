import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<List<dynamic>> getData() async {
  await sendData();
  var client = http.Client();
  var url = "http://192.168.1.21:8000/api/test1/";
  var response = await client.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body) as List<dynamic>;
    print(data);
    return data;
  } else {
    print("server error");
    return [];
  }
}

Future<void> sendData() async {
  var client = http.Client();
  var url = "http://192.168.1.21:8000/api/test1/";
  print(json.encode({
    "block1": "50",
  }));
  var response = await client.post(Uri.parse(url),
      headers: {"ContentType": "application/json"},
      body: json.encode({
        "block1": 50,
        "block2": 20,
        "block3": 70,
        "block4": 40,
      }));
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print("server error");
  }
}

Future<List<String>> getBlocks() async {
  var client = http.Client();
  var url = "http://192.168.1.21:8000/api/getblocks/";

  var response = await client.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print(response.body);
    return (jsonDecode(response.body) as List).map((e) => e as String).toList();
  } else {
    print("server error");
    return [];
  }
}


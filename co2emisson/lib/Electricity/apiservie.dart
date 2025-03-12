import 'dart:convert';
import 'package:co2emisson/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse(mainurl+'/api/electricity/'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

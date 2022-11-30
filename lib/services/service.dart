import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  // Call general API
  Future<Map<String, dynamic>> callApi(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // On response success
      // Decode JSON body and return
      return jsonDecode(response.body);
    } else {
      // On response failed
      throw Exception('Failed to load');
    }
  }
}
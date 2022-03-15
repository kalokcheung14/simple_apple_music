import 'dart:async';
import 'dart:convert';

import 'package:simple_apple_music/models/itunes_result.dart';
import 'package:http/http.dart' as http;

class ApiController {
  static final _instance = ApiController._internal();

  factory ApiController()
  {
    return _instance;
  }

  ApiController._internal();

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

  // Call search API
  Future<ItunesResult> search(String keyword) async {
    // Call API endpoint
    final response = await callApi('https://lifeisbbtea.neocities.org/itunes-result-sample.json');

    // Parse response JSON body to model
    return ItunesResult.fromJson(response);
  }
}
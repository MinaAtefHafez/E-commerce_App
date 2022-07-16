

import 'package:commerce_app/utils/my_strings.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<http.Response> get({
    required String url,
  }) async {
    http.Response response = await http.get(Uri.parse('$baseUrl/$url'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Error in code ${response.statusCode}'); 
    }
  }

  static Future<http.Response> post({
    required url,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.post(
      Uri.parse(
        '$baseUrl/$url',
      ),
      body: body,
      headers: headers ,
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Error in code ${response.statusCode}');
    }
  }
}

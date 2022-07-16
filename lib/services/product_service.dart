// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:commerce_app/helper/api.dart';
import 'package:http/http.dart' as http;

class ProductsServices {

  static Future<List<dynamic>> getAllProducts() async {
    List <dynamic> date = [] ;
    http.Response response = await Api.get(url: 'products');
     date = jsonDecode(response.body);

     return date ;
  }
  
}

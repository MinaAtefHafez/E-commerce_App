import 'package:commerce_app/helper/api.dart';

import 'package:commerce_app/models/category_names_model.dart';
import 'package:commerce_app/models/products_model.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  static Future<List<String>> getCategoryNames() async {
    http.Response response = await Api.get(url: 'products/categories');
    return welcomeFromJson(response.body);
  }

  static Future<List<dynamic>> getAllCategory(String categoryName) async {
    http.Response response =
        await Api.get(url: 'products/category/$categoryName');
    return productFromJson(response.body);
  }
}

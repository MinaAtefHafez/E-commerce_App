// ignore_for_file: must_call_super

import 'package:commerce_app/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  List<dynamic> nameCategoryList = [];
  List<dynamic> categoryList = [];

  @override
  void onInit() {
    getCategoryNames();
  }

  void getCategoryNames() {
    CategoryServices.getCategoryNames().then((value) {
      nameCategoryList.addAll(value);
      update();
    }).catchError((error) {
      Get.snackbar('Error!', error.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: const Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
      update();
    });
  }

  Future<void> getAllCategory(String categoryName) async {
    categoryList = [];
    CategoryServices.getAllCategory(categoryName).then((value) {
      categoryList.addAll(value);

      update();
    }).catchError((error) {
      Get.snackbar('Error!', error.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: const Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
      update();
    });
  }
}

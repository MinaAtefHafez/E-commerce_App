// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:commerce_app/logic/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextFormField extends StatelessWidget {
  var controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(builder: (_) {
      return TextField(
        controller: controller.searchController,
        onChanged: (value) {
          controller.addSearchToList(value);
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: 'search with name & price ',
          hintStyle: TextStyle(
              fontSize: 15,
              color:
                  Get.isDarkMode ? Colors.grey.shade600 : Colors.grey.shade600),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade900,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                controller.clearSearch();
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade100)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade100)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade100)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade100)),
        ),
      );
    });
  }
}

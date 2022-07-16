// ignore_for_file: use_key_in_widget_constructors

import 'package:commerce_app/logic/controllers/category_controller.dart';
import 'package:commerce_app/view/widgets/category/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 30),
            child: Text(
              'Category',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GetBuilder<CategoryController>(builder: (controller) {
            return Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => CategoryItem(
                      controller.nameCategoryList[index],
                      imageCategory[index],
                      index ,
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: controller.nameCategoryList.length),
            );
          }),
        ],
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:commerce_app/logic/controllers/category_controller.dart';
import 'package:commerce_app/view/screens/category_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  String title ;
  String image ;
  int index ;
  CategoryItem (this.title , this.image , this.index );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (controller) {
      return InkWell(
      onTap: () {
         controller.getAllCategory(controller.nameCategoryList[index]).then((value) {
          Get.to(()=> CategoryDetailsScreen(index) );
         });
           
      } ,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
               image ,
               fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 15,
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.all(5) ,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
    });
  }
}

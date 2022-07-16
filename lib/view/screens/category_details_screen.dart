// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable

import 'package:commerce_app/logic/controllers/category_controller.dart';
import 'package:commerce_app/view/widgets/home/card_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsScreen extends StatelessWidget {
  int index;
  CategoryDetailsScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (controller) {
          return ConditionalBuilder(
      condition: controller.categoryList.isNotEmpty ,
       builder: (context) {
        return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.pink : Colors.teal ,
           iconTheme:const IconThemeData(color: Colors.white ) ,
           title: Text('${controller.nameCategoryList[index]}'),
             centerTitle: true ,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.categoryList.length ,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) => CardItem(
                    model: controller.categoryList[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
       }, 
       fallback: (context) =>  Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white ,
        body:  Center(child: CircularProgressIndicator(color: Get.isDarkMode ? Colors.pink : Colors.teal ,)) ,
       ) ,
       );
    } );
  }
}

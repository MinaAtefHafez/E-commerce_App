// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable

import 'package:commerce_app/logic/controllers/products_controller.dart';
import 'package:commerce_app/view/widgets/home/card_item.dart';
import 'package:commerce_app/view/widgets/home/search_text_form_field.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.black : Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find Your',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'INSPIRATION',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SearchTextFormField(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<ProductsController>(builder: (controller) {
              if (controller.searchController.text.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Categories',
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              }
              return Text('');
            }),
            SizedBox(
              height: 30,
            ),
            GetBuilder<ProductsController>(builder: (controller) {
              return ConditionalBuilder(
                  condition: controller.searchController.text.isNotEmpty,
                  builder: (context) {
                    if (controller.searchList.isNotEmpty) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.searchList.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 0.8,
                              mainAxisSpacing: 9.0,
                              crossAxisSpacing: 6.0,
                              maxCrossAxisExtent: 200,
                            ),
                            itemBuilder: (context, index) => CardItem(
                              model: controller.searchList[index],
                            ),
                          ),
                        ),
                      );
                    }
                    return Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Get.isDarkMode
                            ? Image.asset('assets/images/search_empty_dark.png')
                            : Image.asset(
                                'assets/images/search_empry_light.png'),
                      ),
                    );
                  },
                  fallback: (context) {
                    if (controller.products.isNotEmpty) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.products.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 0.8,
                              mainAxisSpacing: 9.0,
                              crossAxisSpacing: 6.0,
                              maxCrossAxisExtent: 200,
                            ),
                            itemBuilder: (context, index) => CardItem(
                              model: controller.products[index],
                            ),
                          ),
                        ),
                      );
                    }

                    return Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: Get.isDarkMode ? Colors.pink : Colors.teal,
                        ),
                      ),
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}

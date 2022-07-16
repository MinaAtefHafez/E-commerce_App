// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, invalid_use_of_protected_member

import 'package:badges/badges.dart';
import 'package:commerce_app/logic/controllers/cart_controller.dart';
import 'package:commerce_app/logic/controllers/main_controller.dart';
import 'package:commerce_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutScreen extends StatelessWidget {
  var controller = Get.find<MainController>();
  var cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Get.isDarkMode ? Colors.black : Colors.teal,
            title: Text(
              controller.appBarTitles.value[controller.currentIndex.value],
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              Obx(
                (() => Padding(
                  padding: const EdgeInsets.only( right : 15),
                  child: Badge(
                        position: BadgePosition.topEnd(top: -1, end: -4 ),
                        animationDuration: Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.slide,
                        badgeContent: Text(
                           cartController.cartList.isNotEmpty ? cartController.totalItems.toString() : 0.toString() ,
                          style: TextStyle(color: Colors.white),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.cartScreen);
                          },
                          child: Image.asset('assets/images/shop.png'),
                        ),
                      ),
                )),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.pinkAccent : Colors.teal,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.pinkAccent : Colors.teal,
                  ),
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Category'),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.pinkAccent : Colors.teal,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: 'favorites',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.pinkAccent : Colors.teal,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: 'settings',
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        ),
      );
    });
  }
}

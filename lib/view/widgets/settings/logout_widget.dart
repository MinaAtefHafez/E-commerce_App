

// ignore_for_file: use_key_in_widget_constructors

import 'package:commerce_app/logic/controllers/auth_controller.dart';
import 'package:commerce_app/logic/controllers/setting_controller.dart';
import 'package:commerce_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutWidget extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return InkWell(
      onTap: (){
        Get.defaultDialog(
        title: 'LogOut',
        titleStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        middleText: 'Are you sure you need to logout from application',
        middleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: 'No',
        textConfirm: 'Yes',
        cancelTextColor: Colors.white,
        confirmTextColor: Colors.white,
        onCancel: () {
          Get.offNamed(Routes.settingScreen);
        },
        onConfirm: () {
          controller.signOutFromApp();
          Get.back();
        });
        
      } ,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.blue, shape: BoxShape.circle),
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GetBuilder<SettingController>(builder: (controller) {
            return Text(
            controller.convert('Logout'), 
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          );
          } ),
        ],
      ),
    );
    } );
  }
}
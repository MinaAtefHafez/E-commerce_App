// ignore_for_file: use_key_in_widget_constructors

import 'package:commerce_app/logic/controllers/setting_controller.dart';
import 'package:commerce_app/logic/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  var controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
              value: controller.switchValue.value,
              onChanged: (value) {
                ThemeController().changesTheme();
                controller.switchValue.value = value;
              } ,
               activeColor: Get.isDarkMode ? Colors.pink :Colors.teal ,
               activeTrackColor: Get.isDarkMode ? Colors.pink :Colors.teal  ,
              ),
        ],
      );
    });
  }

  Widget buildIconWidget() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.deepPurple, shape: BoxShape.circle),
          child: const Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GetBuilder<SettingController>(builder:(controller) {
          return Text(
          controller.convert('DM'),
          style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        );
        } ),
      ],
    );
  }
}

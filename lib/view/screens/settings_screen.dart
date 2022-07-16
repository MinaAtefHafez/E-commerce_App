// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:commerce_app/logic/controllers/auth_controller.dart';
import 'package:commerce_app/logic/controllers/setting_controller.dart';
import 'package:commerce_app/view/widgets/settings/dark_mode_widget.dart';
import 'package:commerce_app/view/widgets/settings/language_item.dart';
import 'package:commerce_app/view/widgets/settings/logout_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 50),
                      child: Container(
                        height: 2.5,
                        width: double.infinity,
                        color: Colors.grey.shade400,
                      ),
                    ),
                   GetBuilder<SettingController>(builder: (controller) {
                    return  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        controller.convert('G'),
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.pink : Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    );
                   } ),
                    DarkModeWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    LanguageItem(),

                    SizedBox(
                      height: 30,
                    ),
                    LogoutWidget(),
                  ],
                ),
          ),
              );
    });
  }
}

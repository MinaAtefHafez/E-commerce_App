// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import 'package:commerce_app/logic/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final bool checkLine;
  final bool isLogin;

  CheckWidget({
    required this.text1,
    required this.text2,
    required this.checkLine,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              if (isLogin == true) {
                controller.signInCheckBox();
              } else {
                controller.signUpCheckBox();
              }
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: isLogin ? controller.isCheckBoxLogin
                  ? Image.asset(
                      'assets/images/check.png',
                    )
                  : Text('') : controller.isCheckBox ? Image.asset(
                      'assets/images/check.png',
                    ) : Text('')  ,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                '${text1} ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
              ),
              Text(
                '${text2}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  decoration: checkLine
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

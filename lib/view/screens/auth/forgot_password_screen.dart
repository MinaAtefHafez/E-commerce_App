// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:commerce_app/logic/controllers/auth_controller.dart';
import 'package:commerce_app/view/widgets/auth_button.dart';
import 'package:commerce_app/view/widgets/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          iconTheme: IconThemeData(
              color: Get.isDarkMode ? Colors.black : Colors.white),
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.teal : Colors.pink,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'if you want to recover your account, then please provide your email ID below..',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/forgotpass.png',
                    width: 250,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AuthTextFormField(
                    controller: emailController,
                    obSecure: false,
                    hint: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Get.isDarkMode
                          ? Color.fromARGB(255, 3, 174, 157)
                          : Colors.pinkAccent,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please , enter your email !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(
                    builder: (controller) {
                      return AuthButton(
                          text: 'Send',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              controller
                                  .resetPassword(emailController.text.trim());
                            }
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

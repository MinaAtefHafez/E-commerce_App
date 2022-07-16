// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:commerce_app/logic/controllers/auth_controller.dart';
import 'package:commerce_app/routes/routes.dart';
import 'package:commerce_app/view/screens/auth/login_screen.dart';
import 'package:commerce_app/view/widgets/auth_button.dart';
import 'package:commerce_app/view/widgets/auth_text_form_field.dart';
import 'package:commerce_app/view/widgets/check_widget.dart';
import 'package:commerce_app/view/widgets/container_under.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 110,
                    ),
                    Row(
                      children: [
                        Text(
                          'SIGN',
                          style: TextStyle(
                              color: Get.isDarkMode
                                  ? Color.fromARGB(255, 3, 207, 186)
                                  : Colors.pinkAccent,
                              fontSize: 40),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'UP',
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              fontSize: 40),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    AuthTextFormField(
                      controller: nameController,
                      obSecure: false,
                      hint: 'User Name',
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(
                        Icons.supervised_user_circle_rounded,
                        color: Get.isDarkMode
                            ? Color.fromARGB(255, 3, 174, 157)
                            : Colors.pinkAccent,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please , enter your User Name !';
                        } else if (value.toString().length < 6) {
                          return 'name must not be less than 6 char !';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
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
                      height: 15,
                    ),
                    AuthTextFormField(
                      controller: passController,
                      obSecure: controller.isVisibility,
                      hint: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Get.isDarkMode
                            ? Color.fromARGB(255, 3, 174, 157)
                            : Colors.pinkAccent,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.visibility();
                        },
                        icon: controller.isVisibility
                            ? Icon(
                                Icons.visibility,
                                color: Colors.black.withOpacity(0.4),
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: Colors.black.withOpacity(0.4),
                              ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please , enter your password !';
                        } else if (value.toString().length < 6) {
                          return 'password must not be less than 6 char !';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CheckWidget(
                      text1: 'I accept',
                      text2: 'terms & conditions',
                      checkLine: false,
                      isLogin: false,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    AuthButton(
                        text: 'SignUp',
                        onTap: () {
                          if (controller.isCheckBox == false) {
                            Get.snackbar('Check Box', 'click on Check Box !',
                                backgroundColor: Colors.green,
                                snackPosition: SnackPosition.BOTTOM);
                          } else if (formKey.currentState!.validate()) {
                            controller.signUp(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passController.text,

                            );
                          }
                        }),
                    SizedBox(
                      height: 80,
                    ),
                    ContainerUnder(
                      text: 'Already have an account?',
                      textButton: 'Login',
                      onPressed: () {
                        Get.offNamed(Routes.loginScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

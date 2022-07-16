// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:commerce_app/logic/controllers/auth_controller.dart';
import 'package:commerce_app/routes/routes.dart';
import 'package:commerce_app/view/widgets/auth_button.dart';
import 'package:commerce_app/view/widgets/auth_text_form_field.dart';
import 'package:commerce_app/view/widgets/check_widget.dart';
import 'package:commerce_app/view/widgets/container_under.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
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
                          'LOG',
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
                          'IN',
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              fontSize: 40),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
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
                      height: 13,
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.forgotPassScreen);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue.shade500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CheckWidget(
                      text1: 'Remember ',
                      text2: 'me',
                      checkLine: controller.isCheckBoxLogin,
                      isLogin:  true,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    AuthButton(
                        text: 'LOGIN',
                        onTap: () {
                          
                          if (formKey.currentState!.validate()) {
                            controller.signIn(
                              rememberMe: controller.isCheckBoxLogin,
                              email: emailController.text,
                              password: passController.text,
                            );
                          }
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                           fontSize: 17 
                          ),
                    ),
                    SizedBox(height: 15,) ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 50,
                            height: 50 ,                        
                            child: Image.asset('assets/images/facebook.png'),),
                        ) ,
                          InkWell(
                            onTap: (){
                              controller.googleSignUp();
                            } ,
                            child: Container(
                            width: 50,
                            height: 50 ,                        
                            child: Image.asset('assets/images/google.png'),),
                          ) ,
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ContainerUnder(
                      text: 'don\'t have an account?',
                      textButton: 'SignUp',
                      onPressed: () {
                        Get.offNamed(Routes.signUpScreen);
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

// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'dart:ui';

import 'package:commerce_app/logic/controllers/cart_controller.dart';
import 'package:commerce_app/view/widgets/payment/delivery_container_widget.dart';
import 'package:commerce_app/view/widgets/payment/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayMentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.teal,
          elevation: 0.0,
          centerTitle: true,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('PayMent'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'shipping to',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                DeliveryContainerWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'PayMent Methods',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                PayMentMethodWidget(),
                const SizedBox(
                  height: 30,
                ),
                 GetBuilder<CartController>(builder: (controller) {
                  return Center(
                  child: Text(
                    'total : ${controller.totalPrice}\$',
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                );
                 } ),
                const SizedBox(height: 20 ,) ,
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50 ,
                    width: 130 ,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.pink : Colors.teal , 
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Text('Pay Now' , style: TextStyle(color: Colors.white , fontSize: 22   ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

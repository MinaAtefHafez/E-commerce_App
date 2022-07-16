// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations, curly_braces_in_flow_control_structures

import 'package:commerce_app/logic/controllers/cart_controller.dart';
import 'package:commerce_app/routes/routes.dart';
import 'package:commerce_app/view/widgets/cart/cart_item.dart';
import 'package:commerce_app/view/widgets/cart/empty_catr.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  var cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.teal,
          elevation: 0.0,
          centerTitle: true,
          titleSpacing: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Cart Screen'),
          actions: [
            GetBuilder<CartController>(builder: (_) {
              return IconButton(
                onPressed: () {
                  cartController.clearAllCartItems();
                },
                icon: Icon(
                  Icons.backspace,
                ),
              );
            })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Obx(() {
                if (cartController.cartList.isNotEmpty)
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            CartItem(cartController.cartList[index]),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 15,
                            ),
                        itemCount: cartController.cartList.length),
                  );
                return EmptyCart();
              }),
              SizedBox(
                height: 30,
              ),
              Obx((){
                return ConditionalBuilder(
                  condition: cartController.cartList.isNotEmpty ,
                   builder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GetBuilder<CartController>(
                            builder: ((controller) => Text(
                                  '${controller.totalPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: InkWell(
                            onTap: (){
                              Get.offNamed(Routes.payMentScreen);
                            } ,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'CheckOut',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ), 
                    fallback: (context) => Text(''),
                    ) ;
              }),
            ],
          ),
        ),
      ),
    );
  }
}

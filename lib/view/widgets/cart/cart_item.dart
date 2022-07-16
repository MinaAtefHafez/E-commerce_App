// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:commerce_app/logic/controllers/cart_controller.dart';
import 'package:commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  ProductsModel model;

  CartItem(this.model);

  var cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? Colors.pink.withOpacity(0.7)
                  : Colors.teal.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Container(  
                height: 120,
                width: 100,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: const EdgeInsets.only(left: 15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Image.network(
                  '${model.image}',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.description}',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      double price;
                     
                      price = cartController.cartMap[model.id]['price'];
                      
                      return Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      );
                    }),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              cartController.subtractItem(model);
                            },
                            icon: Icon(
                              Icons.remove_circle,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          Text('${cartController.cartMap[model.id]['number']}'),
                          IconButton(
                            onPressed: () {
                              cartController.plusItem(model);
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: ()  {
                           cartController.removeItemFromCartList(model);
                          
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Get.isDarkMode ? Colors.black : Colors.red,
                          size: 20,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

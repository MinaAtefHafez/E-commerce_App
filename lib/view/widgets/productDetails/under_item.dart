// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:commerce_app/logic/controllers/cart_controller.dart';
import 'package:commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnderItem extends StatelessWidget {
  ProductsModel model;
  UnderItem({required this.model});
  var controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${model.price}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          GetBuilder<CartController>(
            builder: (_) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: InkWell(
                    onTap: () {
                      controller.addProductToCart2(model);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        'Add To Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors, must_be_immutable

import 'package:commerce_app/logic/controllers/cart_controller.dart';
import 'package:commerce_app/logic/controllers/products_controller.dart';
import 'package:commerce_app/models/products_model.dart';
import 'package:commerce_app/view/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItem extends StatelessWidget {
  ProductsModel model;

  CardItem({required this.model});

  var controller = Get.find<ProductsController>();
  var cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0, left: 5.0, top: 5.0),
      child: InkWell(
        onTap: () {
          Get.to(() => ProductDetailsScreen(model: model));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Get.isDarkMode ? Colors.black : Colors.grey.shade300,
                spreadRadius: 2.0,
                blurRadius: 1.0,
              ),
            ],
          ),
          child: Column(
            children: [
              
               GetBuilder<ProductsController>(builder: (controller) {
                return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.isFavorite(
                        productId: model.id! ,
                        model: model ,
                        
                      );
                    },
                    icon: Icon(
                      Icons.favorite_outlined,
                      color:  controller.isItemInFavorite(model.id!) == true ? Colors.red : Colors.teal.shade200 ,
                    ),
                  ),
                  Expanded(
                    child: Text(
                       model.title! ,
                      style:
                          TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          maxLines: 1 ,
                          overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await cartController.addProductToCart(model);
                      cartController.generateTotalPrices();
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
               } ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(model.image!, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${model.price}',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${model.rating!.rate}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

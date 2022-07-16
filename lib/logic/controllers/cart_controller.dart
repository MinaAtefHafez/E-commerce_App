// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:commerce_app/models/prices_model.dart';
import 'package:commerce_app/models/products_model.dart';
import 'package:commerce_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartList = [].obs;
  var cartMap = {}.obs;
  double totalPrice = 0;
  var totalItems = 0.obs;
  var allPrices = [].obs;

  Future<void> addProductToCart(ProductsModel model) async {
    bool isItemExist = false;

    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].id == model.id) {
        isItemExist = true;
      }
    }

    if (isItemExist == false) {
      cartList.add(model);
      cartMap.addAll({
        model.id: {'price': model.price, 'number': 1}.obs
      });
    } else if (cartList.isEmpty) {
      cartList.add(model);
      cartMap.addAll({
        model.id: {'price': model.price, 'number': 1}.obs,
      });
    } else if (isItemExist) {
      isItemExist = false;
    }
  }

  void addProductToCart2 (ProductsModel model) {
    bool isItemExist = false;

    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].id == model.id) {
        isItemExist = true;
      }
    }

    if (isItemExist == false) {
      cartList.add(model);
      cartMap.addAll({
        model.id: {'price': model.price, 'number': 1}.obs
      });
      generateTotalPrices();
    } else if (cartList.isEmpty) {
      cartList.add(model);
      cartMap.addAll({
        model.id: {'price': model.price, 'number': 1}.obs,
      });
      generateTotalPrices();
    } else if (isItemExist) {
      plusItem(model);
      isItemExist = false;
    }
    update();
  }

  void plusItem(ProductsModel model) {
    cartMap[model.id]['price'] = cartMap[model.id]['price'] + model.price;
    cartMap[model.id]['number']++;
    generateTotalPrices();
    update();
  }

  void subtractItem(ProductsModel model) {
    if (cartMap[model.id]['number'] > 1) {
      cartMap[model.id]['price'] = cartMap[model.id]['price'] - model.price;
      cartMap[model.id]['number']--;
      generateTotalPrices();
    } else {
      removeItemFromCartList(model);
    }
  }

  void removeItemFromCartList(ProductsModel model) {
    cartMap.remove(model.id);
    cartList.remove(model);
    generateTotalPrices();
  }

  void clearAllCartItems() {
    Get.defaultDialog(
        title: 'Clean Products',
        titleStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        middleText: 'Are you sure you need to clear products',
        middleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: 'No',
        textConfirm: 'Yes',
        cancelTextColor: Colors.white,
        confirmTextColor: Colors.white,
        onCancel: () {
          Get.offNamed(Routes.cartScreen);
        },
        onConfirm: () {
          deleteItems();
          Get.back();
        });
  }

  void deleteItems() {
    cartMap = {}.obs;
    cartList.removeRange(0, cartList.length);
    generateTotalPrices();
  }

  void generateTotalPrices() {
    allPrices = [].obs;
    cartMap.forEach((key, value) {
      allPrices.add(PricesModel.fromJson(value));
    });
    totalPrice = 0;
    totalItems.value = 0;
    for (int i = 0; i < allPrices.length; i++) {
      totalPrice = totalPrice + allPrices[i].price;
      totalItems = totalItems + allPrices[i].number;
    }
    update();
  }
}

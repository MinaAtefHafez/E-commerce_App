// ignore_for_file: avoid_function_literals_in_foreach_calls, must_call_super, invalid_use_of_protected_member, unnecessary_brace_in_string_interps

import 'package:commerce_app/models/products_model.dart';
import 'package:commerce_app/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductsController extends GetxController {
  List products = <ProductsModel>[];
  List favorites = <ProductsModel>[];
  List searchList = <ProductsModel>[];
  TextEditingController searchController = TextEditingController();
  var storage = GetStorage();

  @override
  void onInit() async {
    await getFavoritesListFromStorage();
    getProducts();
  }

  void getProducts() {
    ProductsServices.getAllProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        products.add(ProductsModel.fromJson(value[i]));
        
      }
      update();
    }).catchError((error) {
      Get.snackbar('Error!', error.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: const Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
          update();
    });
   
  }

  void isFavorite(
      {required int productId, required ProductsModel model}) async {
    bool? isFavorite;
    isFavorite = isItemInFavorite(productId);
    if (!isFavorite) {
      favorites.add(model);
      storage.write('isFavoritesList', favorites);
    } else {
      removeFromFavorites(model);
    }

    update();
  }

  void removeFromFavorites(ProductsModel model) async {
    favorites.remove(model);
    await storage.write('isFavoritesList', favorites);

    update();
  }

  Future<void> getFavoritesListFromStorage() async {
    List? storedShoppings = storage.read<List>('isFavoritesList');
    if (storedShoppings != null) {
      favorites =
          storedShoppings.map((e) => ProductsModel.fromJson(e)).toList().obs;
    }
    update();
  }

  bool isItemInFavorite(int productId) {
    return favorites.any((element) => element.id == productId);
    
  }

  void addSearchToList(String search) {
    String convertToLowerTitle ;
    searchList = [] ;
    for (int i = 0; i < products.length; i++) {
         convertToLowerTitle = products[i].title.toLowerCase() ;
      if (convertToLowerTitle.contains(search) ||
          products[i].price.toString().contains(search)) {
        searchList.add(products[i]);
      }
    }
    update();
  }

  void clearSearch () {
    searchController.clear() ;
    update();
  }
}

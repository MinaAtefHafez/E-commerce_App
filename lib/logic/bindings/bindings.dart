

import 'package:commerce_app/logic/controllers/auth_controller.dart';
import 'package:commerce_app/logic/controllers/category_controller.dart';
import 'package:commerce_app/logic/controllers/main_controller.dart';
import 'package:commerce_app/logic/controllers/payment_controller.dart';
import 'package:commerce_app/logic/controllers/products_controller.dart';
import 'package:commerce_app/logic/controllers/cart_controller.dart';
import 'package:commerce_app/logic/controllers/setting_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController()) ;
    Get.put<MainController>(MainController()) ;
    Get.put<ProductsController>(ProductsController()) ;
    Get.put<CartController>(CartController());
    Get.put<CategoryController>(CategoryController());
    Get.put<SettingController>(SettingController());
    Get.put<PayMentController>(PayMentController());
  }

}
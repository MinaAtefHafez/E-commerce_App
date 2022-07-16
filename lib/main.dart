// ignore_for_file: use_key_in_widget_constructors

import 'package:commerce_app/logic/bindings/bindings.dart';
import 'package:commerce_app/logic/controllers/theme_controller.dart';
import 'package:commerce_app/routes/routes.dart';
import 'package:commerce_app/utils/my_strings.dart';
import 'package:commerce_app/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  uId = GetStorage().read<String>('uId') ?? '';
  isLangEn = GetStorage().read('isEn') ?? true ;
  
  

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: GetStorage().read<bool>('auth') == true
          ? AppRoutes.layOut
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}

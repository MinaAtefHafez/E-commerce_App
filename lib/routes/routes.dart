

// ignore_for_file: prefer_const_literals_to_create_immutables


import 'package:commerce_app/view/screens/auth/forgot_password_screen.dart';
import 'package:commerce_app/view/screens/auth/login_screen.dart';
import 'package:commerce_app/view/screens/auth/signup_screen.dart';
import 'package:commerce_app/view/screens/home_screen.dart';
import 'package:commerce_app/view/screens/layout_screen.dart';
import 'package:commerce_app/view/screens/payment_screen.dart';
import 'package:commerce_app/view/screens/settings_screen.dart';
import 'package:commerce_app/view/screens/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:commerce_app/view/screens/cart_screen.dart';

class AppRoutes {
 
  // initialRoutes

    static const welcome = Routes.welcomeScreen ;
    static const layOut = Routes.layoutScreen ;

  // getPages 
    
    static final routes = [
      GetPage(
        name: Routes.welcomeScreen ,
         page: () => WelcomeScreen() ,
         ),
      GetPage(
        name: Routes.loginScreen ,
         page: () => LoginScreen(), 
          
         ),
      GetPage(
        name: Routes.signUpScreen ,
         page: () => SignUpScreen()  ,
        
         ),
      GetPage(
        name: Routes.forgotPassScreen ,
         page: () => ForgotPassScreen() 
            ),
            GetPage(
        name: Routes.layoutScreen ,
         page: () => LayoutScreen()  ,
         
         ),
         
  GetPage(
        name: Routes.homeScreen ,
         page: () => HomeScreen() ,
         
         ),

         GetPage(
        name: Routes.cartScreen ,
         page: () => CartScreen() ,
         
         ),
         GetPage(
        name: Routes.settingScreen ,
         page: () => SettingsScreen() ,
         
         ),
         GetPage(
        name: Routes.payMentScreen ,
         page: () => PayMentScreen() ,
         
         ),
    ] ;


}


class Routes {

  static const welcomeScreen = '/WelcomeScreen' ;
  static const forgotPassScreen = '/ForgotPassScreen' ; 
  static const loginScreen   = '/LoginScreen' ;
  static const signUpScreen = '/SignUpScreen' ;
  static const layoutScreen = '/LayoutScreen' ;
  static const homeScreen = '/HomeScreen' ;
  static const cartScreen = '/CartScreen' ;
  static const settingScreen = '/SettingsScreen' ;
  static const payMentScreen = '/PayMentScreen' ;

}
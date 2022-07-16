
import 'package:commerce_app/view/screens/category_screen.dart';
import 'package:commerce_app/view/screens/favorites_screen.dart';
import 'package:commerce_app/view/screens/home_screen.dart';
import 'package:commerce_app/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {

   RxInt currentIndex = 0.obs ;

   final tabs = [
     HomeScreen(),
     CategoryScreen() ,
     FavoritesScreen() ,
     SettingsScreen(),
   ].obs;

   final appBarTitles = [
     'Mina Shop' ,
     'Category',
     'Favorites' ,
     'Settings'
   ].obs;

}
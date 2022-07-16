import 'package:commerce_app/utils/my_strings.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;

   final Map<String, String> en = {
    'G': 'GENERAL',
    'DM': 'Dark Mode',
    'L': 'Language',
    'Logout': 'Logout',
  };

  final Map<String, String> ar = {
    'G': 'عام',
    'DM': 'الوضع الداكن',
    'L': 'لغة',
    'Logout': 'تسجيل خروج',
  };

 

  String convert(String key) {
    if (isLangEn) {
      return en[key]!;
    }

    return ar[key]!;
  }

  void upDate() {
    update();
  }
}

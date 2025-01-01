import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TranslateController extends GetxController {
  void changeLanguage(String Language) {
    var locale = Locale(Language);
    Get.updateLocale(locale);
  }
}

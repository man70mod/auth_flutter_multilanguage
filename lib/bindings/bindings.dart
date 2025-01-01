import 'package:get/get.dart';
import 'package:auth_flutter/controller/translate_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TranslateController());
  }
}

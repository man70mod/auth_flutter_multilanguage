import 'package:auth_flutter/controller/translate_controller.dart';
import 'package:auth_flutter/views/layouts/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBarCustom(title: 'ورود'.tr),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/1.png',
                width: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('لطفا شماره خود را وارد کنید.'.tr),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('پیامک به این شماره ارسال خواهد شد:'.tr),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'شماره موبایل را وارد کنید.'.tr,
                hintStyle: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/login/otp');
                    },
                    child: Text('مرحله بعد'.tr))),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(81, 118, 107, 236),
                          elevation: 0),
                      onPressed: () {
                        Get.find<TranslateController>().changeLanguage('en');
                      },
                      child: Text('English')),
                  ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(81, 118, 107, 236),
                          elevation: 0),
                      onPressed: () {
                        Get.find<TranslateController>().changeLanguage('fa');
                      },
                      child: Text('فارسی')),
                  ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(81, 118, 107, 236),
                          elevation: 0),
                      onPressed: () {
                        Get.find<TranslateController>().changeLanguage('ar');
                      },
                      child: Text('عربی'))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

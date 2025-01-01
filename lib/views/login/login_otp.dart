import 'dart:async';
//import 'dart:io';
import 'package:auth_flutter/helper/constance.dart';
import 'package:auth_flutter/views/layouts/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginOtp extends StatelessWidget {
  const LoginOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SafeArea(
        child: Scaffold(
      appBar: const AppBarCustom(
        title: 'دریافت کد',
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: const Text('کد را وارد کنید:'),
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  //otp code
                  child: otpCode(formKey: formKey)),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('کد ارسال نشده است؟'),
                      SizedBox(
                        width: 5,
                      ),
                      counterDown(),
                      //  Text('ارسال مجدد', style: TextStyle(color: Colors.blue),),
                    ],
                  ),
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
            ],
          ),
        ),
      ),
    ));
  }
}

class otpCode extends StatefulWidget {
  const otpCode({super.key, required this.formKey});
  final GlobalKey formKey;
  static TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  @override
  State<otpCode> createState() => _otpCodeState();
}

class _otpCodeState extends State<otpCode> {
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        pastedTextStyle: TextStyle(
          color: ConstColor.backgroundAppBar,
          fontWeight: FontWeight.bold,
        ),
        length: 5,

        blinkWhenObscuring: true,
        animationType: AnimationType.fade,

        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          activeColor: ConstColor.backgroundAppBar,
          inactiveColor: ConstColor.backgroundAppBar,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: otpCode.textEditingController,
        keyboardType: TextInputType.number,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        onCompleted: (v) {
          debugPrint("Completed");
        },
        // onTap: () {
        //   print("Pressed");
        // },
        onChanged: (value) {
          debugPrint(value);
          setState(() {
            currentText = value;
          });
        },
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}

class counterDown extends StatefulWidget {
  const counterDown({super.key});

  @override
  State<counterDown> createState() => _counterDownState();
}

class _counterDownState extends State<counterDown> {
  late Timer timer;
  //late یعنی بعدا مقدار دهی میکنم
  String text = '';
  int addMin = 2;
  DateTime counterDown = DateTime.now();

  @override
  void initState() {
    runCounterDown();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void runCounterDown() {
    counterDown = counterDown.add(Duration(minutes: addMin));
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      var now = DateTime.now();

      var distance = counterDown.difference(now);

      var min = distance.inMinutes;
      var sec = distance.inSeconds % 60;

      if (sec < 10) {}
      print("$min:$sec");
    });
  }
}

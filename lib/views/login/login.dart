import 'package:auth_flutter/views/layouts/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      
      appBar:const AppBarCustom(title: 'ورود',),
      body: Container(),
    ));
  }
}
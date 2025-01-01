import 'package:auth_flutter/helper/constance.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget
{
  const AppBarCustom({super.key, required this.title, this.centerTitle=true
  });

  final String title;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(title,
      style: TextStyle(fontSize: 18,color: Colors.white),
      ),
      centerTitle:centerTitle,
       backgroundColor: ConstColor.backgroundAppBar,


    );
  }
  
  @override
 
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
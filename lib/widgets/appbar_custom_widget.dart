import 'package:bmi_app/core/colors.dart';
import 'package:flutter/material.dart';

class AppbarCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  AppbarCustomWidget({super.key,required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appbarColor,
      title: Text(
        title,
        style: TextStyle(
          color: white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      toolbarHeight: 50,
      elevation: 7,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}

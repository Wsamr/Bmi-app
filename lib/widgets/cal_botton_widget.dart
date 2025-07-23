import 'package:bmi_app/core/colors.dart';
import 'package:flutter/material.dart';

class CalBottonWidget extends StatelessWidget {
  CalBottonWidget({super.key, this.onPressed, required this.title});
  void Function()? onPressed;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: calBottonColor,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: white,
          ),
        ),
      ),
    );
  }
}

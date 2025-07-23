import 'package:bmi_app/core/colors.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  GenderWidget({super.key, required this.imagePath, required this.type,required this.isMale,required this.onTap});
  String imagePath;
  String type;
  bool isMale;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
          decoration: BoxDecoration(
            color: isMale ? selectedContainerColor :unSelectedContainerColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 96, width: 96),
              Text(
                type,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: subText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bmi_app/core/colors.dart';
import 'package:flutter/material.dart';

class FloatBottonWidget extends StatelessWidget {
  FloatBottonWidget({super.key, required this.icon, this.onPressed});
  IconData icon;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: bottonColor,
      onPressed: onPressed,
      child: Icon(icon, color: white),
    );
  }
}

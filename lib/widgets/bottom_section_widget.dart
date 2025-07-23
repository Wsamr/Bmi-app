import 'package:bmi_app/core/colors.dart';
import 'package:bmi_app/widgets/float_botton_widget.dart';
import 'package:flutter/material.dart';

class BottomSectionWidget extends StatelessWidget {
  BottomSectionWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.add,
    this.remove,
  });
  String title;
  String subTitle;
  void Function()? add;
  void Function()? remove;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: unSelectedContainerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: subText,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: white,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatBottonWidget(icon: Icons.remove, onPressed: remove),
                FloatBottonWidget(icon: Icons.add, onPressed: add),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

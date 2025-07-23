import 'package:bmi_app/core/colors.dart';
import 'package:bmi_app/models/cal_data_model.dart';
import 'package:bmi_app/screens/home_screen.dart';
import 'package:bmi_app/widgets/appbar_custom_widget.dart';
import 'package:bmi_app/widgets/cal_botton_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var calData = ModalRoute.of(context)!.settings.arguments as CalDataModel;
    double bmi = calData.weight / pow(calData.height / 100, 2);
    Color cateColor = resultTextStatus;
    String getBMICategory() {
      if (bmi < 15) {
        cateColor = Colors.redAccent;
        return "Very severely underweight";
      } else if (bmi >= 15 && bmi < 16) {
        cateColor = Colors.orangeAccent;
        return "Severely underweight";
      } else if (bmi >= 16 && bmi < 18.5) {
        cateColor = Colors.yellow;
        return "Underweight";
      } else if (bmi >= 18.5 && bmi < 25) {
        return "Normal (healthy weight)";
      } else if (bmi >= 25 && bmi < 30) {
        cateColor = Colors.yellow;
        return "Overweight";
      } else if (bmi >= 30 && bmi < 35) {
        cateColor = Colors.orangeAccent;
        return "Moderately obese";
      } else if (bmi >= 35 && bmi < 40) {
        cateColor = Colors.red;
        return "Severely obese";
      } else {
        cateColor = Colors.red;
        return "Very severely obese";
      }
    }

    return Scaffold(
      appBar: AppbarCustomWidget(title: "BMI Calculator"),
      body: Column(
        children: [
          Text(
            "Your Result",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: white,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 50),
              width: double.infinity,
              decoration: BoxDecoration(
                color: unSelectedContainerColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  Text(
                    "${getBMICategory()}",
                    style: TextStyle(
                      color: cateColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "${bmi.round()}",
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                      color: white,
                    ),
                  ),
                  SizedBox(height: 60),
                  Text(
                    "You Have a Normal Body Weight,Good Job.",
                    style: TextStyle(
                      color: subText,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CalBottonWidget(
        title: "Re - Calculate",
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

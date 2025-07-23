import 'package:bmi_app/core/colors.dart';
import 'package:bmi_app/models/cal_data_model.dart';
import 'package:bmi_app/widgets/appbar_custom_widget.dart';
import 'package:bmi_app/widgets/bottom_section_widget.dart';
import 'package:bmi_app/widgets/cal_botton_widget.dart';
import 'package:bmi_app/widgets/float_botton_widget.dart';
import 'package:bmi_app/widgets/gender_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 155;
  int weight = 50;
  int age = 20;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustomWidget(title: "BMI Calculator"),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: Row(
                children: [
                  GenderWidget(
                    imagePath: "assets/images/male-image.png",
                    type: "Male",
                    isMale: isMale,
                    onTap: () {
                      isMale = true;
                      setState(() {});
                    },
                  ),
                  SizedBox(width: 9),
                  GenderWidget(
                    imagePath: "assets/images/female-image.png",
                    type: "Female",
                    isMale: !isMale,
                    onTap: () {
                      isMale = false;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 30, right: 16, left: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: unSelectedContainerColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: subText,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${height.round()}",
                        style: TextStyle(
                          color: white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    onChanged: (value) {
                      height = value;
                      setState(() {});
                    },
                    min: 50,
                    max: 200,
                    activeColor: calBottonColor,
                    inactiveColor: white,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: Row(
                spacing: 9,
                children: [
                  BottomSectionWidget(
                    title: "Weight",
                    subTitle: "$weight",
                    add: () {
                      if (weight > 0) {
                        weight++;
                        setState(() {});
                      }
                    },
                    remove: () {
                      if (weight > 0) {
                        weight--;
                        setState(() {});
                      }
                    },
                  ),
                  BottomSectionWidget(
                    title: "Age",
                    subTitle: "$age",
                    add: () {
                      if (age > 0 && age <= 100) {
                        age++;
                        setState(() {});
                      }
                    },
                    remove: () {
                      if (age > 0 && age <= 100) {
                        age--;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CalBottonWidget(
        title: "Calculate",
        onPressed: () {
          Navigator.pushNamed(
            context,
            "resultScreen",
            arguments: CalDataModel(
              height: height.round(),
              weight: weight,
              age: age,
              isMale: isMale,
            ),
          );
        },
      ),
    );
  }
}

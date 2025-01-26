// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:muslim_todp/widgets/custom_appbar.dart';
import 'package:muslim_todp/widgets/date_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  DateTime _selectedDate = DateTime.now(); // Store the selected date

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: CustomAppBar(
          selectedDate: _selectedDate,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomDatePicker(
              onDateSelected: (date) {
                // Update the selected date
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.moon,
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          width: 90,
                        ),
                        Gap(10),
                        Text(
                          "الضهر",
                          style: TextStyle(
                            fontFamily: 'cairo',
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          color: AppColor.secondary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Icon(
                          Icons.gpp_good,
                          color: Colors.green,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

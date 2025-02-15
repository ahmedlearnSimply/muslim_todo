// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:muslim_todp/pages/azkar/pray_azkar.dart';
import 'package:muslim_todp/widgets/custom_appbar.dart';

class Tasbeeh extends StatefulWidget {
  const Tasbeeh({super.key});

  @override
  State<Tasbeeh> createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> {
  DateTime _selectedDate = DateTime.now(); // Track selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        leading: Center(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        toolbarHeight: 90,
        backgroundColor: AppColor.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(top: 18),
              width: 75,
              child: Opacity(
                opacity: 1,
                child: Image.asset(AppImages.beadsPng),
              ),
            ),
            Gap(20),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "تسبيـــــــــــح",
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Tasbeeh App'),
      ),
    );
  }
}

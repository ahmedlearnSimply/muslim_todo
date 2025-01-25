// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:muslim_todp/widgets/date_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          toolbarHeight: 80,
          title: Column(
            children: [
              Text(
                'يوم السبت',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'cairo',
                ),
              ),
              Gap(5),
              Text(
                '25-1-2025',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'cairo',
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomDatePicker(),
            Text("daf"),
          ],
        ),
      ),
    );
  }
}

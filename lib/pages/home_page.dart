// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
            Text("daf"),
          ],
        ),
      ),
    );
  }
}

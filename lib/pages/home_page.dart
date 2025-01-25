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
  DateTime _selectedDate = DateTime.now(); // Store the selected date

  String _formatDate(DateTime date) {
    final dayName = _getDayName(date.weekday); // Get day name (e.g., Saturday)
    final day = date.day;
    final month = date.month;
    final year = date.year;
    return '$dayName, $day-$month-$year';
  }

  // Function to get the day name
  String _getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'الإثنين';
      case 2:
        return 'الثلاثاء';
      case 3:
        return 'الأربعاء';
      case 4:
        return 'الخميس';
      case 5:
        return 'الجمعة';
      case 6:
        return 'السبت';
      case 7:
        return 'الأحد';
      default:
        return '';
    }
  }

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
                _getDayName(_selectedDate.weekday),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'cairo',
                ),
              ),
              Gap(5),
              Text(
                '${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}',
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

// ignore_for_file: prefer_const_constructors

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:muslim_todp/core/colors/app_color.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: AppColor.primaryColor),
          child: DatePicker(
            height: 100,
            DateTime.now(),
            deactivatedColor: AppColor.primaryColor,
            daysCount: DateTime.daysPerWeek,
            dayTextStyle: TextStyle(
              color: Colors.white,
            ),
            monthTextStyle: TextStyle(
              color: Colors.white,
            ),
            dateTextStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'cairo',
            ),
            initialSelectedDate: DateTime.now(),
            selectionColor: AppColor.blue,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}

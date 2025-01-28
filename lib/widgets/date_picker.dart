// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:muslim_todp/core/colors/app_color.dart';

class CustomDatePicker extends StatefulWidget {
  CustomDatePicker({
    super.key,
    required this.onDateSelected,
  });
  final Function(DateTime) onDateSelected; // Callback function

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
            width: 70,
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
              setState(() {
                widget.onDateSelected(date);
              });
            },
          ),
        ),
      ],
    );
  }
}

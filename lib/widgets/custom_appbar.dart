// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/colors/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80);
  final DateTime selectedDate; // Pass the selected date as a parameter

  const CustomAppBar({super.key, required this.selectedDate});

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
    return AppBar(
      actions: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 40, // Adjust width as needed
            height: 40, // Adjust height as needed
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(20), // Adjust border radius
            ),
            child: Center(
              // Center the IconButton
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30, // Adjust icon size as needed
                ),
                padding: EdgeInsets.zero, // Remove default padding
              ),
            ),
          ),
        )
      ],
      toolbarHeight: 80,
      title: Column(
        children: [
          Text(
            _getDayName(selectedDate.weekday), // Use the selected date
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'cairo',
            ),
          ),
          Gap(5),
          Text(
            '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}', // Use the selected date
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'cairo',
            ),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: AppColor.primaryColor,
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tasbeeh extends StatefulWidget {
  const Tasbeeh({super.key});

  @override
  State<Tasbeeh> createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> {
  DateTime _selectedDate = DateTime.now();
  int counter = 0;
  int totalCounter = 0;
  double _scale = 1.0;

  //* Shared perfreneces logic
  //! Save Data
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', counter);
    prefs.setInt('totalCounter', totalCounter);
  }

  //! load data
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter') ?? 0;
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
      totalCounter = prefs.getInt('totalCounter') ?? 0;
    });
  }

  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter++;
      totalCounter++;
    });
    await prefs.setInt('counter', counter);
    await prefs.setInt('totalCounter', totalCounter);
  }

  Future<void> _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = 0;
    });
    await prefs.setInt('counter', counter);
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
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColor.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(top: 18),
              width: 70,
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // Adjust opacity (0.0 - 1.0)
              BlendMode.darken, // Applies the color filter
            ),
            image: AssetImage("assets/icons/stars.jpg"), // Local image
            fit: BoxFit.cover, // Covers the entire screen
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Gap(20),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Text(
                        counter.toString(),
                        style: TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      " تسبيح  ${_getDayName(_selectedDate.weekday)}",
                      style: TextStyle(
                        fontFamily: 'cairoNormal',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Gap(20),
                  FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      // Custom shape
                      borderRadius: BorderRadius.circular(20), // Rounded edges
                      side: BorderSide(
                          color: Colors.white, width: 2), // White border
                    ),
                    onPressed: () {
                      //* reset the counter
                      setState(() {
                        _resetCounter();
                      });
                    },
                    child: Icon(Icons.replay, color: Colors.white),
                    backgroundColor: AppColor.blue,
                  ),
                  Gap(10),
                  Text(
                    "اعاده",
                    style: TextStyle(
                        fontFamily: 'cairo',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
              Gap(10),
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _scale = 0.99; // Shrink when pressed
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _scale = 1.0; // Expand back to normal size
                    _incrementCounter();
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _scale = 1.0; // Reset if tap is canceled
                  });
                },
                child: Transform.scale(
                  scale: _scale,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(150),
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 65, 150, 220),
                          AppColor.blue,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    totalCounter.toString(),
                    style: TextStyle(
                        fontFamily: 'cairo',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 72, 172, 253)),
                  ),
                  Gap(20),
                  Text(
                    "مجموع التسبيحات",
                    style: TextStyle(
                      fontFamily: 'cairoNormal',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// GestureDetector(
//   onTap: () {
//     //*increase the counter
//     setState(() {
//       counter++;
//     });
//   },
//   child: Container(
//     width: 300,
//     height: 300,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(150),
//       gradient: LinearGradient(
//         colors: [
//           const Color.fromARGB(255, 101, 183, 250),
//           AppColor.blue,
//         ],
//       ),
//     ),
//   ),
// ),

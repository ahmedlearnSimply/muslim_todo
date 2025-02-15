// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';

class Tasbeeh extends StatefulWidget {
  const Tasbeeh({super.key});

  @override
  State<Tasbeeh> createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> {
  DateTime _selectedDate = DateTime.now();
  int counter = 0;
  double _scale = 1.0;

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
      body: Padding(
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
              child: Center(
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
                      counter = 0;
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
                    color: AppColor.blue,
                  ),
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
                  counter++;
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
                  counter.toString(),
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
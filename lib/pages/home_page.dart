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
  bool _isPrayed = false;
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
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                        ),
                        backgroundColor: Colors.white, // Background color
                        elevation: 10, // Add shadow
                        title: Text(
                          "هل صليت الفرض اليوم؟",
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor, // Custom title color
                          ),
                          textAlign: TextAlign.center,
                        ),
                        content: Column(
                          mainAxisSize:
                              MainAxisSize.min, // Minimize content height
                          children: [
                            Text(
                              "الضهر",
                              style: TextStyle(
                                fontFamily: 'cairoNormal',
                                fontSize: 24,
                                color: Colors.black87, // Custom text color
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10), // Add spacing
                            Text(
                              "هل صليت؟",
                              style: TextStyle(
                                fontFamily: 'cairoNormal',
                                fontSize: 20,
                                color: Colors.black54, // Custom text color
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // "No" Button
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isPrayed = false; // Update the state
                                  });
                                  Navigator.pop(context); // Close the dialog
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red, // Button color
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Rounded button
                                  ),
                                ),
                                child: Text(
                                  "للأسف",
                                  style: TextStyle(
                                    fontFamily: 'cairo',
                                    fontSize: 18,
                                    color: Colors.white, // Text color
                                  ),
                                ),
                              ),
                              // "Yes" Button
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isPrayed = true; // Update the state
                                  });
                                  Navigator.pop(context); // Close the dialog
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Button color
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Rounded button
                                  ),
                                ),
                                child: Text(
                                  "نعم",
                                  style: TextStyle(
                                    fontFamily: 'cairo',
                                    fontSize: 18,
                                    color: Colors.white, // Text color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
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
                            _isPrayed
                                ? Icons.gpp_good
                                : Icons.gpp_bad, // Dynamic icon
                            color: _isPrayed
                                ? Colors.green
                                : Colors.red, // Dynamic color
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:muslim_todp/pages/azkar/morning_app.dart';
import 'package:muslim_todp/pages/azkar/night_app.dart';
import 'package:muslim_todp/pages/azkar/pray_azkar.dart';
import 'package:muslim_todp/pages/azkar/qeam_azkar.dart';
import 'package:muslim_todp/pages/azkar/rokae.dart';
import 'package:muslim_todp/pages/azkar/sleeping_azkar.dart';

class AzkarHome extends StatelessWidget {
  AzkarHome({super.key});
  DateTime _selectedDate = DateTime.now(); // Track selected date

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
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
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "اذكار الصباح والمساء",
                      style: TextStyle(
                        fontFamily: 'cairoNormal',
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NightAzkar(
                                    selectedDate: _selectedDate,
                                  )),
                        );
                      },
                      child: AzkarHomeCard(
                        image: AppImages.nightPng,
                        title: "اذكار المساء",
                        subtitle: "٢٠ ذكر",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MorningAzkar(selectedDate: _selectedDate)),
                        );
                      },
                      child: AzkarHomeCard(
                        image: AppImages.morningPng,
                        title: "اذكار الصباح",
                        subtitle: "٢١ ذكر",
                      ),
                    ),
                  ],
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "اذكار متنوعه",
                      style: TextStyle(
                        fontFamily: 'cairoNormal',
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SleepingAzkar(selectedDate: _selectedDate)),
                        );
                      },
                      child: AzkarHomeCard(
                        image: AppImages.sleepPng,
                        title: "اذكار النوم",
                        subtitle: "١٢ ذكر",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PrayAzkar(selectedDate: _selectedDate)),
                        );
                      },
                      child: AzkarHomeCard(
                        image: AppImages.prayPng,
                        title: "اذكار الصلاه",
                        subtitle: "١٢ ذكر",
                      ),
                    ),
                  ],
                ),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Rokae(
                                    selectedDate: _selectedDate,
                                  )),
                        );
                      },
                      child: AzkarHomeCard(
                        width: 200,
                        image: AppImages.rokaaPng,
                        title: "الرُّقية الشرعية",
                        subtitle: "٧ ذكر",
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => QeamAzkar(
                    //                 selectedDate: _selectedDate,
                    //               )),
                    //     );
                    //   },
                    //   child: AzkarHomeCard(
                    //     image: AppImages.nigthPray,
                    //     title: "قيام الليل",
                    //     subtitle: "٢٥ ذكر",
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AzkarHomeCard extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  double height;
  double width;

  AzkarHomeCard({
    required this.image,
    this.height = 150,
    this.width = 150,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3), // Shadow color
            offset: Offset(1, 1), // Horizontal and vertical offset
            blurRadius: 5, // Blur radius
            spreadRadius: 2, // Spread radius (optional)
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Gap(10),
          Image.asset(
            image,
            width: 70,
          ),
          Gap(5),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'cairo',
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'cairoNormal',
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

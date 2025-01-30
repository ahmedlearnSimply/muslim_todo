// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:muslim_todp/widgets/custom_appbar.dart';
import 'package:muslim_todp/widgets/date_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  void print() {
    log(_selectedDate.toString());
  }

  Map<String, bool> _prayerStatus = {
    "الفجر": false,
    "الضهر": false,
    "العصر": false,
    "المغرب": false,
    "العشا": false,
  };
  List<String> prayers = ["الفجر", "الضهر", "العصر", "المغرب", "العشا"];

  @override
  void initState() {
    super.initState();
  }

// Load prayer status from SharedPreferences
  // void _loadPrayerStatus() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     for (String prayer in prayers) {
  //       _prayerStatus[prayer] = prefs.getBool(prayer) ?? false;
  //     }
  //   });
  // }

  // Save prayer status to SharedPreferences
//   void _savePrayerStatus(String prayerName, bool isPrayed) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(prayerName, isPrayed);

//   }
// // Save prayer status for the selected date
  void _savePrayerStatus(String prayerName, bool isPrayed) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = '${_selectedDate.toIso8601String()}_$prayerName';
    // Include date in the key
    await prefs.setBool(key, isPrayed);
  }

// Load prayer status for the selected date
  void _loadPrayerStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (String prayer in prayers) {
        String key =
            '${_selectedDate.toIso8601String()}_$prayer'; // Include date in the key
        _prayerStatus[prayer] = prefs.getBool(key) ?? false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: CustomAppBar(
          selectedDate: _selectedDate,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomDatePicker(
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                    _loadPrayerStatus();
                  });
                },
              ),
              Gap(20),
              buildPrayerCard('الفجر'),
              buildPrayerCard('الضهر'),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPrayerCard(String prayerName) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () => _showPrayerDialog(prayerName),
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
                  Gap(10),
                  SvgPicture.asset(
                    AppImages.praySvg,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 60,
                  ),
                  Gap(20),
                  Text(
                    prayerName,
                    style: TextStyle(
                      fontFamily: 'cairo',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
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
                    _prayerStatus[prayerName]! ? Icons.gpp_good : Icons.gpp_bad,
                    color:
                        _prayerStatus[prayerName]! ? Colors.green : Colors.red,
                    size: 60,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//! method
  void _showPrayerDialog(String prayerName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          elevation: 10,
          title: Text(
            "هل صليت الفرض اليوم؟",
            style: TextStyle(
              fontFamily: 'cairo',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                prayerName,
                style: TextStyle(
                  fontFamily: 'cairoNormal',
                  fontSize: 24,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "هل صليت؟",
                style: TextStyle(
                  fontFamily: 'cairoNormal',
                  fontSize: 20,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //! button for changing the icon to false
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _prayerStatus[prayerName] = false;
                      _savePrayerStatus(prayerName, false);
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "للأسف",
                    style: TextStyle(
                      fontFamily: 'cairo',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _prayerStatus[prayerName] = true;
                      _savePrayerStatus(prayerName, true);
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "نعم",
                    style: TextStyle(
                      fontFamily: 'cairo',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

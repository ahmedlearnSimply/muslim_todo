// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerCard extends StatefulWidget {
  final String image;
  final String prayerName;
  bool isPrayed;
  final Function(bool) onPrayerStatusChanged;
  final BuildContext parentContext;

  PrayerCard({
    super.key,
    required this.image,
    required this.prayerName,
    required this.isPrayed,
    required this.onPrayerStatusChanged,
    required this.parentContext,
  });

  State<PrayerCard> createState() => _PrayerCardState();
}

class _PrayerCardState extends State<PrayerCard> {
  //! saveData
  void saveData() async {
    // save data here
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(widget.prayerName, widget.isPrayed);
  }

  //! getdata
  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.isPrayed = prefs.getBool(widget.prayerName) ?? false;
    });
  }

  void _showPrayerDialog() {
    showDialog(
      context: widget.parentContext,
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
                widget.prayerName,
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
                    widget.isPrayed = false;
                    saveData();
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
                    widget.isPrayed = true;
                    saveData();
                    Navigator.pop(context);
                    log(widget.prayerName);
                    getData();
                    log(widget.isPrayed.toString());
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: _showPrayerDialog,
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
                    widget.image,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 60,
                  ),
                  Gap(20),
                  Text(
                    widget.prayerName,
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
                    widget.isPrayed ? Icons.gpp_good : Icons.gpp_bad,
                    color: widget.isPrayed ? Colors.green : Colors.red,
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
}

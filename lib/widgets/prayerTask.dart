// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';

class PrayerCard extends StatelessWidget {
  final String image;
  final String prayerName;
  final bool isPrayed;
  final Function(bool) onPrayerStatusChanged;
  final BuildContext parentContext;

  const PrayerCard({
    super.key,
    required this.image,
    required this.prayerName,
    required this.isPrayed,
    required this.onPrayerStatusChanged,
    required this.parentContext,
  });

  void _showPrayerDialog() {
    showDialog(
      context: parentContext,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
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
            mainAxisSize: MainAxisSize.min, // Minimize content height
            children: [
              Text(
                prayerName, // Use the provided prayer name
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
                    onPrayerStatusChanged(
                        false); // Update prayer status to false
                    Navigator.pop(context); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded button
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
                    onPrayerStatusChanged(true); // Update prayer status to true
                    Navigator.pop(context); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded button
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
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: _showPrayerDialog, // Show the dialog when tapped
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
                    image,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 60,
                  ),
                  Gap(20),
                  Text(
                    prayerName, // Use the provided prayer name
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
                    isPrayed ? Icons.gpp_good : Icons.gpp_bad, // Dynamic icon
                    color:
                        isPrayed ? Colors.green : Colors.red, // Dynamic color
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

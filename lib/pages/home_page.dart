// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:muslim_todp/widgets/custom_appbar.dart';
import 'package:muslim_todp/widgets/date_picker.dart';
import 'package:muslim_todp/widgets/prayerTask.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();

  Map<String, bool> _prayerStatus = {
    "الفجر": false,
    "الضهر": false,
    "العصر": false,
    "المغرب": false,
    "العشا": false,
  };
  List<String> prayers = ["الفجر", "الضهر", "العصر", "المغرب", "العشا"];
  bool _isLoading = true;
  int counter = 1;
  @override
  void initState() {
    _loadPrayerStatus();
    super.initState();
  }

  // Generate a consistent key for saving/loading prayer status
  String _getPrayerKey(String prayerName) {
    // Use a consistent date format (e.g., 'yyyy-MM-dd')
    String dateKey =
        '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}';
    return '${dateKey}_$prayerName';
  }

  // Save prayer status for the selected date
  void _savePrayerStatus(String prayerName, bool isPrayed) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = _getPrayerKey(prayerName); // Use consistent key format
    await prefs.setBool(key, isPrayed);
    setState(() {
      _prayerStatus[prayerName] = isPrayed;
    });
  }

  // Load prayer status for the selected date
  void _loadPrayerStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (String prayer in prayers) {
        String key = _getPrayerKey(prayer); // Use consistent key format
        _prayerStatus[prayer] = prefs.getBool(key) ?? false;
      }
      _isLoading = false; // Data loading is complete
    });
  }

  void showCompleteDialog() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (String prayer in prayers) {
        String key = _getPrayerKey(prayer);

        if (prefs.getBool(key) == true) {
          counter++;
        }
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomDatePicker(
                  onDateSelected: (date) {
                    setState(() {
                      _selectedDate = date;
                      _loadPrayerStatus();
                    });
                    _loadPrayerStatus();
                  },
                ),
                Gap(20),
                PrayerCard(
                  prayerName: 'الفجر',
                  onTap: () => _showPrayerDialog('الفجر'),
                  isPrayerDone: _prayerStatus['الفجر']!,
                  image: AppImages.moon,
                ),
                PrayerCard(
                  prayerName: 'الضهر',
                  onTap: () => _showPrayerDialog('الضهر'),
                  isPrayerDone: _prayerStatus['الضهر']!,
                  image: AppImages.duhar,
                ),
                PrayerCard(
                  prayerName: 'العصر',
                  onTap: () => _showPrayerDialog('العصر'),
                  isPrayerDone: _prayerStatus['العصر']!,
                  image: AppImages.asar,
                ),
                PrayerCard(
                  prayerName: 'المغرب',
                  onTap: () => _showPrayerDialog('المغرب'),
                  isPrayerDone: _prayerStatus['المغرب']!,
                  image: AppImages.magharib,
                ),
                PrayerCard(
                  prayerName: 'العشا',
                  onTap: () => _showPrayerDialog('العشا'),
                  isPrayerDone: _prayerStatus['العشا']!,
                  image: AppImages.isha,
                ),
                // (counter == 4)
                //     ? Text(
                //         "good",
                //         style: TextStyle(fontSize: 40),
                //       )
                //     : Text(
                //         "good",
                //         style: TextStyle(fontSize: 40),
                //       )
              ],
            ),
          ),
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
                    if (_prayerStatus.values.every((status) => status)) {
                      _showCompletionDialog();
                    }
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

  void _showCompletionDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return ScaleTransition(
          scale: animation,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.white,
            elevation: 10,
            title: Center(
              child: Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 60),
                  SizedBox(height: 10),
                  Text(
                    "ما شاء الله!",
                    style: TextStyle(
                      fontFamily: 'cairo',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            content: Text(
              "لقد أكملت جميع الصلوات اليوم ✅",
              style: TextStyle(
                fontFamily: 'cairoNormal',
                fontSize: 18,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "حسناً",
                    style: TextStyle(
                      fontFamily: 'cairo',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }
}

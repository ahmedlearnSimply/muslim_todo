// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:muslim_todp/widgets/custom_appbar.dart';
import 'package:muslim_todp/widgets/date_picker.dart';
import 'package:muslim_todp/widgets/prayerTask.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  DateTime _selectedDate = DateTime.now();
  Map<String, bool> _prayerStatus = {
    "الفجر": false,
    "الضهر": false,
    "العصر": false,
    "المغرب": false,
    "العشا": false,
  }; // Store the selected date
  bool _isPrayed = false;
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
                  // Update the selected date
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
              Gap(20),
              PrayerCard(
                prayerName: "الفجر",
                image: AppImages.moon,
                isPrayed: _prayerStatus['الفجر'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  setState(() {
                    _prayerStatus['الفجر'] = newStatus;
                  });
                },
                parentContext: context,
              ),
              PrayerCard(
                prayerName: "الضهر",
                image: AppImages.duhar,
                isPrayed: _prayerStatus['الضهر'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  setState(() {
                    _prayerStatus['الضهر'] = newStatus;
                  });
                },
                parentContext: context,
              ),
              PrayerCard(
                prayerName: "العصر",
                image: AppImages.asar,
                isPrayed: _prayerStatus['العصر'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  setState(() {
                    _prayerStatus['العصر'] = newStatus;
                  });
                },
                parentContext: context,
              ),
              PrayerCard(
                prayerName: "المغرب",
                image: AppImages.magharib,
                isPrayed: _prayerStatus['المغرب'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  setState(() {
                    _prayerStatus['المغرب'] = newStatus;
                  });
                },
                parentContext: context,
              ),
              PrayerCard(
                prayerName: "العشا",
                image: AppImages.isha,
                isPrayed: _prayerStatus['العشا'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  setState(() {
                    _prayerStatus['العشا'] = newStatus;
                  });
                },
                parentContext: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

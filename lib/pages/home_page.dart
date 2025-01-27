import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  void initState() {
    super.initState();
    _loadPrayerStatus(); // Load prayer status when the app starts
  }

  DateTime _selectedDate = DateTime.now();
  Map<String, bool> _prayerStatus = {
    "الفجر": false,
    "الضهر": false,
    "العصر": false,
    "المغرب": false,
    "العشا": false,
  };

  void _updatePrayerStatus(
      String prayerName, bool status, DateTime selectedDate) {
    setState(() {
      _prayerStatus[prayerName] = status;
    });
    // Save to Hive
    final prayerBox = Hive.box('prayerBox');
    prayerBox.put(
      prayerName,
      status,
    );
  }

  void _loadPrayerStatus() {
    final prayerBox = Hive.box('prayerBox');
    setState(() {
      _prayerStatus = {
        "الفجر": prayerBox.get(
          'الفجر',
          defaultValue: false,
        ),
        "الضهر": prayerBox.get('${_selectedDate}الضهر', defaultValue: false),
        "العصر": prayerBox.get('${_selectedDate.toIso8601String()}_العصر',
            defaultValue: false),
        "المغرب": prayerBox.get('${_selectedDate.toIso8601String()}_المغرب',
            defaultValue: false),
        "العشا": prayerBox.get('${_selectedDate.toIso8601String()}_العشا',
            defaultValue: false),
      };
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
                  // Update the selected date
                  setState(() {
                    _selectedDate = date;
                  });
                  _loadPrayerStatus(); // Reload prayer status for the new date
                },
              ),
              Gap(20),
              PrayerCard(
                prayerName: "الفجر",
                image: AppImages.moon,
                isPrayed: _prayerStatus['الفجر'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  _updatePrayerStatus("الفجر", newStatus, _selectedDate);
                },
                parentContext: context,
              ),
              PrayerCard(
                prayerName: "الضهر",
                image: AppImages.duhar,
                isPrayed: _prayerStatus['الضهر'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  _updatePrayerStatus("الضهر", newStatus, _selectedDate);
                },
                parentContext: context,
              ),
              PrayerCard(
                prayerName: "العصر",
                image: AppImages.asar,
                isPrayed: _prayerStatus['العصر'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  _updatePrayerStatus("العصر", newStatus, _selectedDate);
                },
                parentContext: context,
              ),
              PrayerCard(
                prayerName: "المغرب",
                image: AppImages.magharib,
                isPrayed: _prayerStatus['المغرب'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  _updatePrayerStatus("المغرب", newStatus, _selectedDate);
                },
                parentContext: context,
              ),
              PrayerCard(
                prayerName: "العشا",
                image: AppImages.isha,
                isPrayed: _prayerStatus['العشا'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  _updatePrayerStatus("العشا", newStatus, _selectedDate);
                },
                parentContext: context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Hive.box('prayerBox')
        .close(); // Close the Hive box when the app is disposed
    super.dispose();
  }
}

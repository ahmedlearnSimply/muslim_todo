import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:muslim_todp/core/services/app_local_storage.dart';
import 'package:muslim_todp/widgets/custom_appbar.dart';
import 'package:muslim_todp/widgets/date_picker.dart';
import 'package:muslim_todp/widgets/prayerTask.dart';

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

  @override
  void initState() {
    super.initState();
  }

  // // Load prayer status from Hive
  // void _loadPrayerStatus() {
  //   setState(() {
  //     _prayerStatus.forEach((prayerName, _) {
  //       _prayerStatus[prayerName] = AppLocalStorage.getCachedData(
  //             '${_selectedDate}_$prayerName',
  //           ) ??
  //           false;
  //     });
  //   });
  // }

  // Update prayer status and save to Hive
  void _updatePrayerStatus(String prayerName, bool status) {
    setState(() {
      _prayerStatus[prayerName] = status;
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
                  });
                },
              ),
              Gap(20),
              PrayerCard(
                prayerName: "الفجر",
                image: AppImages.moon,
                isPrayed: _prayerStatus['الفجر'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  // _updatePrayerStatus("الفجر", newStatus);
                },
                parentContext: context,
              ),
              PrayerCard(
                prayerName: "الضهر",
                image: AppImages.duhar,
                isPrayed: _prayerStatus['الضهر'] ?? false,
                onPrayerStatusChanged: (newStatus) {
                  // _updatePrayerStatus("الضهر", newStatus);
                },
                parentContext: context,
              ),
              // Add more PrayerCards for other prayers
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

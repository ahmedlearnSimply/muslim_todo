// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:muslim_todp/widgets/custom_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MorningAzkar extends StatefulWidget {
  @override
  _MorningAzkarState createState() => _MorningAzkarState();
}

class _MorningAzkarState extends State<MorningAzkar> {
  late SharedPreferences prefs;
  Map<String, int> azkar = {
    "أعوذ بالله من الشيطان الرجيم : { اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلاَّ بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ } .":
        10,
    "بسم الله الرحمن الرحيم : { قُلْ هُوَ اللَّهُ أَحَدٌ، اللَّهُ الصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ } .":
        33,
    // Add more Azkar here...
  };

  @override
  void initState() {
    super.initState();
    _loadCounters();
  }

  Future<void> _loadCounters() async {
    prefs = await SharedPreferences.getInstance();
    Map<String, int> loadedAzkar = {};

    azkar.forEach((key, value) {
      loadedAzkar[key] = prefs.getInt(key) ?? value;
    });

    setState(() {
      azkar = loadedAzkar;
    });
  }

  Future<void> _saveCounter(String key, int value) async {
    await prefs.setInt(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          toolbarHeight: 90,
          backgroundColor: AppColor.primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(top: 18),
                width: 100,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    AppImages.morningPng,
                  ),
                ),
              ),
              Gap(20),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "اذكار الصباح",
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
        backgroundColor: AppColor.background,
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          physics: BouncingScrollPhysics(),
          itemCount: azkar.length,
          itemBuilder: (context, index) {
            final entry = azkar.entries.elementAt(index);
            return CounterScreen(
              text: entry.key,
              counter: entry.value,
              onDecrement: (newValue) {
                setState(() {
                  azkar[entry.key] = newValue;
                });
                _saveCounter(entry.key, newValue);
              },
            );
          },
        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  final String text;
  final int counter;
  final Function(int) onDecrement;

  const CounterScreen({
    Key? key,
    required this.text,
    required this.counter,
    required this.onDecrement,
  }) : super(key: key);

  void _decrementCounter() {
    if (counter > 0) {
      onDecrement(counter - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: 'cairo',
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  counter > 0 ? counter.toString() : "تم",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: counter > 0 ? Colors.blue : Colors.green,
                  ),
                ),
                if (counter > 0)
                  ElevatedButton(
                    onPressed: _decrementCounter,
                    child: Text(
                      "إنقاص",
                      style: TextStyle(fontSize: 16),
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

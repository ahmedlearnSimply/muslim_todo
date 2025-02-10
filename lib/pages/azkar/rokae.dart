// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rokae extends StatefulWidget {
  final DateTime selectedDate;

  Rokae({required this.selectedDate});

  @override
  _RokaeState createState() => _RokaeState();
}

class _RokaeState extends State<Rokae> {
  late SharedPreferences prefs;
  Map<String, int> azkar = {
    "  أَعُوذُ بِاللَّهِ الْعَظِيمِ، وَبِوَجْهِهِ الْكَرِيمِ، وَسُلْطَانِهِ الْقَدِيمِ، مِنَ الشَّيْطَانِ الرَّجِيمِ.":
        1,
    " أَعُوذُ بِاللهِ مِنَ الشَّيْطَانِ الرَّجِيمِ، مِنْ هَمْزِهِ وَنَفْخِهِ وَنَفْثِهِ.":
        1,
    " أعوذُ بكلماتِ اللهِ التامَّةِ ، مِن كُلِّ شيطانٍ وهامَّةٍ ، ومِن كُلِّ عَيْنٍ لامَّةٍ":
        1,
    " أعوذُ بكلماتِ اللهِ التامَّاتِ مِن شرِّ ما خَلق.": 1,
    " بِسْمِ اللَّهِ أَرْقِيكَ، مِنْ كُلِّ شَيْءٍ يُؤْذِيكَ، مِنْ شَرِّ كُلِّ نَفْسٍ أَوْ عَيْنِ حَاسِدٍ، اللَّهُ يَشْفِيكَ، بِسْمِ اللَّهِ أَرْقِيكَ.":
        1,
    "بِسْمِ اللَّهِ ": 1,
    "أَعُوذُ بِاللَّهِ وَقُدْرَتِهِ مِنْ شَرِّ مَا أَجِدُ وَأُحَاذِرُ ": 7,
    " أَسْأَلُ اللَّهَ الْعَظِيمَ رَبَّ الْعَرْشِ الْعَظِيمِ، أَنْ يُعَافِيَكَ وَيَشْفِيَكَ.":
        1,
    " اللَّهُمَّ ربَّ النَّاسِ، أَذْهِب الْبَأسَ، واشْفِ، أَنْتَ الشَّافي لا شِفَاءَ إِلاَّ شِفَاؤُكَ، شِفاءً لا يُغَادِرُ سقَماً.":
        1,
  };

  @override
  void initState() {
    super.initState();
    _loadCounters(widget.selectedDate);
  }

  Future<void> _loadCounters(DateTime selectedDate) async {
    prefs = await SharedPreferences.getInstance();
    Map<String, int> loadedAzkar = {};

    azkar.forEach((key, value) {
      String dateKey =
          'Rokae_${selectedDate.year}-${selectedDate.month}-${selectedDate.day}_$key';
      loadedAzkar[key] = prefs.getInt(dateKey) ?? value;
    });

    setState(() {
      azkar = loadedAzkar;
    });
  }

  Future<void> _saveCounter(String key, int value) async {
    String dateKey =
        'Rokae_${widget.selectedDate.year}-${widget.selectedDate.month}-${widget.selectedDate.day}_$key';
    await prefs.setInt(dateKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          leading: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          toolbarHeight: 90,
          backgroundColor: AppColor.primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(top: 18),
                width: 70,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    AppImages.rokaaPng,
                  ),
                ),
              ),
              Gap(20),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "الرُّقية الشرعية",
                  style: TextStyle(
                    fontFamily: 'cairo',
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
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
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      // elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                text,
                style: TextStyle(
                  letterSpacing: .4,
                  fontFamily: 'cairoNormal',
                  height: 2,
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: counter > 0 ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //* share function
                    GestureDetector(
                      onTap: () {
                        // share button
                      },
                      child: Row(
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: _decrementCounter,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: counter > 0
                                      ? AppColor.blue
                                      : AppColor.primaryColor,
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(20),
                          Text(
                            "مشاركه",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'cairoNormal',
                              fontWeight: FontWeight.bold,
                              color: counter > 0
                                  ? AppColor.blue
                                  : AppColor.primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        color: Colors.black,
                        width: 10,
                        thickness: 2,
                      ),
                    ),

                    //* Decrement function
                    GestureDetector(
                      onTap: _decrementCounter,
                      child: Row(
                        children: [
                          Text(
                            "التكرار",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'cairoNormal',
                              fontWeight: FontWeight.bold,
                              color: counter > 0
                                  ? AppColor.blue
                                  : AppColor.primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Gap(20),
                          Center(
                            child: GestureDetector(
                              onTap: _decrementCounter,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: counter > 0
                                      ? AppColor.blue
                                      : AppColor.primaryColor,
                                ),
                                child: Center(
                                  child: Text(
                                    counter > 0 ? counter.toString() : "تم",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'cairoNormal',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

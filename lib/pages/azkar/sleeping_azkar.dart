// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SleepingAzkar extends StatefulWidget {
  final DateTime selectedDate;

  SleepingAzkar({required this.selectedDate});

  @override
  _SleepingAzkarState createState() => _SleepingAzkarState();
}

class _SleepingAzkarState extends State<SleepingAzkar> {
  late SharedPreferences prefs;
  Map<String, int> azkar = {
    "أعوذ بالله من الشيطان الرجيم : { اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلاَّ بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ } .":
        1,
    "بسم الله الرحمن الرحيم :{ قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّالنَّفَّاثَاتِ فِي الْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ } .":
        3,
    "أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ : { آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ ۚ كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ ۚ وَقَالُوا سَمِعْنَا وَأَطَعْنَا ۖ غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ. لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَسِينَا أَوْ أَخْطَأْنَا رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ } .":
        3,
    "اللّهُـمَّ إِنَّـكَ خَلَـقْتَ نَفْسـي وَأَنْـتَ تَوَفّـاهـا لَكَ ممَـاتـها وَمَحْـياها ، إِنْ أَحْيَيْـتَها فاحْفَظْـها ، وَإِنْ أَمَتَّـها فَاغْفِـرْ لَـها . اللّهُـمَّ إِنَّـي أَسْـأَلُـكَ العـافِـيَة.":
        3,
    "بسم الله الرحمن الرحيم : { قُلْ هُوَ اللَّهُ أَحَدٌ، اللَّهُ الصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ } .":
        3,
    "بسم الله الرحمن الرحيم { قُلْ أَعُوذُ بِرَبِّ النَّاسِ، مَلِكِ النَّاسِ، إِلَهِ النَّاسِ، مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ، الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ، مِنَ الْجِنَّةِ وَ النَّاسِ } .":
        3,
    "بِاسْمِكَ رَبِّـي وَضَعْـتُ جَنْـبي ، وَبِكَ أَرْفَعُـه، فَإِن أَمْسَـكْتَ نَفْسـي فارْحَـمْها ، وَإِنْ أَرْسَلْتَـها فاحْفَظْـها بِمـا تَحْفَـظُ بِه عِبـادَكَ الصّـالِحـين.":
        5,
    "اللّهُـمَّ قِنـي عَذابَـكَ يَـوْمَ تَبْـعَثُ عِبـادَك.": 4,
    "بِاسْـمِكَ اللّهُـمَّ أَمـوتُ وَأَحْـيا.": 4,
    "الـحَمْدُ للهِ الَّذي أَطْـعَمَنا وَسَقـانا، وَكَفـانا، وَآوانا، فَكَـمْ مِمَّـنْ لا كـافِيَ لَـهُ وَلا مُـؤْوي.":
        2,
    "اللّهُـمَّ أَسْـلَمْتُ نَفْـسي إِلَـيْكَ، وَفَوَّضْـتُ أَمْـري إِلَـيْكَ، وَوَجَّـهْتُ وَجْـهي إِلَـيْكَ، وَأَلْـجَـاْتُ ظَهـري إِلَـيْكَ، رَغْبَـةً وَرَهْـبَةً إِلَـيْكَ، لا مَلْجَـأَ وَلا مَنْـجـا مِنْـكَ إِلاّ إِلَـيْكَ، آمَنْـتُ بِكِتـابِكَ الّـذي أَنْزَلْـتَ وَبِنَبِـيِّـكَ الّـذي أَرْسَلْـت.":
        1,
    "اللّهُـمَّ عالِـمَ الغَـيبِ وَالشّـهادةِ فاطِـرَ السّماواتِ وَالأرْضِ رَبَّ كُـلِّ شَـيءٍ وَمَليـكَه، أَشْهـدُ أَنْ لا إِلـهَ إِلاّ أَنْت، أَعـوذُ بِكَ مِن شَـرِّ نَفْسـي، وَمِن شَـرِّ الشَّيْـطانِ وَشِـرْكِه، وَأَنْ أَقْتَـرِفَ عَلـى نَفْسـي سوءاً أَوْ أَجُـرَّهُ إِلـى مُسْـلِم.":
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
          'sleep_${selectedDate.year}-${selectedDate.month}-${selectedDate.day}_$key';
      loadedAzkar[key] = prefs.getInt(dateKey) ?? value;
    });

    setState(() {
      azkar = loadedAzkar;
    });
  }

  Future<void> _saveCounter(String key, int value) async {
    String dateKey =
        'sleep_${widget.selectedDate.year}-${widget.selectedDate.month}-${widget.selectedDate.day}_$key';
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
                width: 100,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    AppImages.nightPng,
                  ),
                ),
              ),
              Gap(20),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "اذكار المساء",
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
            Text(
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

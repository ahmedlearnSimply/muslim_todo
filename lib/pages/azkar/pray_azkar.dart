// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayAzkar extends StatefulWidget {
  final DateTime selectedDate;

  PrayAzkar({required this.selectedDate});

  @override
  _PrayAzkarState createState() => _PrayAzkarState();
}

class _PrayAzkarState extends State<PrayAzkar> {
  late SharedPreferences prefs;
  Map<String, int> azkar = {
    "أسـتغفر الله، أسـتغفر الله، أسـتغفر الله. اللهـم أنـت السلام ، ومـنك السلام ، تباركت يا ذا الجـلال والإكـرام.":
        1,
    "لا إله إلا الله وحده لا شريك له، له المـلك وله الحمد، وهو على كل شيء قدير، اللهـم لا مانع لما أعطـيت، ولا معطـي لما منـعت، ولا ينفـع ذا الجـد منـك الجـد.":
        1,
    "لا إله إلا الله, وحده لا شريك له، له الملك وله الحمد، وهو على كل شيء قدير، لا حـول ولا قـوة إلا بالله، لا إله إلا اللـه، ولا نعـبـد إلا إيـاه, له النعـمة وله الفضل وله الثـناء الحـسن، لا إله إلا الله مخلصـين لـه الدين ولو كـره الكـافرون.":
        1,
    "سـبحان الله، والحمـد لله ، والله أكـبر. (ثلاثا وثلاثين). لا إله إلا الله وحـده لا شريك له، له الملك وله الحمد، وهو على كل شيء قـدير.":
        33,
    "أعوذ بالله من الشيطان الرجيم : { اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلاَّ بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ } .":
        1,
    "بسم الله الرحمن الرحيم : { قُلْ هُوَ اللَّهُ أَحَدٌ، اللَّهُ الصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ } .":
        3,
    "بسم الله الرحمن الرحيم :{ قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّالنَّفَّاثَاتِ فِي الْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ } .":
        3,
    "بسم الله الرحمن الرحيم { قُلْ أَعُوذُ بِرَبِّ النَّاسِ، مَلِكِ النَّاسِ، إِلَهِ النَّاسِ، مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ، الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ، مِنَ الْجِنَّةِ وَ النَّاسِ } .":
        3,
    "لا إله إلا الله وحـده لا شريك له، له الملك وله الحمد، يحيـي ويمـيت وهو على كل شيء قدير.":
        1,
    "اللهـم إنـي أسألـك علمـا نافعـا ورزقـا طيـبا ، وعمـلا متقـبلا .": 1,
    "اللهم أجرنى من النار .": 7,
    "اللهـم أعنى على ذكرك وشكرك وحسن عبادتك .": 1,
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
          'pray_${selectedDate.year}-${selectedDate.month}-${selectedDate.day}_$key';
      loadedAzkar[key] = prefs.getInt(dateKey) ?? value;
    });

    setState(() {
      azkar = loadedAzkar;
    });
  }

  Future<void> _saveCounter(String key, int value) async {
    String dateKey =
        'pray_${widget.selectedDate.year}-${widget.selectedDate.month}-${widget.selectedDate.day}_$key';
    await prefs.setInt(dateKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: SecondCustomAppBar(),
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

class SecondCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  SecondCustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(90),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                AppImages.prayPng,
              ),
            ),
          ),
          Gap(20),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "اذكار الصلاه",
              style: TextStyle(
                fontFamily: 'cairo',
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
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

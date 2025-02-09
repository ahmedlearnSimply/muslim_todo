import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  final String text;
  final int initialCounter;

  const CounterScreen({
    Key? key,
    required this.text,
    required this.initialCounter,
  }) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late int counter;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    counter = widget.initialCounter;
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> _saveCounter() async {
    await prefs.setInt(widget.text, counter);
  }

  void _decrementCounter() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
      _saveCounter();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.text)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter > 0 ? counter.toString() : "تم",
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (counter > 0)
              ElevatedButton(
                onPressed: _decrementCounter,
                child: const Text("إنقاص"),
              ),
          ],
        ),
      ),
    );
  }
}

class MorningAzkar extends StatefulWidget {
  @override
  _MorningAzkarState createState() => _MorningAzkarState();
}

class _MorningAzkarState extends State<MorningAzkar> {
  late SharedPreferences prefs;
  Map<String, int> azkar = {
    "سبحان الله وبحمده": 33,
    "الحمد لله": 33,
    "الله أكبر": 34,
  };

  @override
  void initState() {
    super.initState();
    _loadCounters();
  }

  Future<void> _loadCounters() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      azkar.forEach((key, value) {
        azkar[key] = prefs.getInt(key) ?? value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("أذكار الصباح")),
      body: ListView(
        children: azkar.entries.map((entry) {
          return ListTile(
            title: Text(entry.key),
            trailing: Text(entry.value.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CounterScreen(
                    text: entry.key,
                    initialCounter: entry.value,
                  ),
                ),
              ).then((_) => _loadCounters());
            },
          );
        }).toList(),
      ),
    );
  }
}

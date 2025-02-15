// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:muslim_todp/pages/azkar/pray_azkar.dart';
import 'package:muslim_todp/widgets/custom_appbar.dart';

class Tasbeeh extends StatefulWidget {
  const Tasbeeh({super.key});

  @override
  State<Tasbeeh> createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> {
  DateTime _selectedDate = DateTime.now(); // Track selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondCustomAppBar(),
      body: Center(
        child: Text('Tasbeeh App'),
      ),
    );
  }
}

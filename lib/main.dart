// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:muslim_todp/pages/home_page.dart';
import 'package:muslim_todp/widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBarWidget(),
    );
  }
}

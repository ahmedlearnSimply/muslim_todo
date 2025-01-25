// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:muslim_todp/core/colors/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          toolbarHeight: 80,
          title: Column(
            children: [
              Text(
                '31 December',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Saturday',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:muslim_todp/core/colors/app_color.dart';

class CounterScreen extends StatefulWidget {
  final int counter;
  final String text;
  final VoidCallback onDecrement;

  const CounterScreen({
    required this.counter,
    required this.text,
    required this.onDecrement,
  });

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    bool isCompleted = widget.counter == 0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: isCompleted ? Colors.grey : AppColor.primaryColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: Column(
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    fontFamily: 'cairoNormal',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                _buildCounterRow(isCompleted),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterRow(bool isCompleted) {
    return Container(
      width: 350,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isCompleted ? Color(0xff3f826d) : AppColor.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {
              // Share functionality
            },
          ),
          Text("مشاركة",
              style: TextStyle(
                  fontFamily: 'cairoNormal',
                  fontSize: 24,
                  color: Colors.white)),
          VerticalDivider(color: Colors.white, width: 20, thickness: 2),
          if (!isCompleted)
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      widget.onDecrement();
                    });
                  },
                ),
                Text("${widget.counter} ",
                    style: TextStyle(fontSize: 21, color: Colors.white)),
                Text("التكرار",
                    style: TextStyle(
                        fontFamily: 'cairoNormal',
                        fontSize: 24,
                        color: Colors.white)),
              ],
            )
          else
            Text("تم",
                style: TextStyle(
                    fontFamily: 'cairoNormal',
                    fontSize: 24,
                    color: Colors.white)),
        ],
      ),
    );
  }
}

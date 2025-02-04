// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:muslim_todp/core/colors/app_color.dart';

//Todo :
// must finish this problem search on it
int colorr = 0;

// ignore: must_be_immutable
class CounterScreen extends StatefulWidget {
  int counter = 0;
  int flag = 1;
  String text = "";

  // static int counter = 5;
  CounterScreen({required this.counter, required this.text});
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    void _decrementCounter() {
      setState(() {
        widget.counter--;
        if (widget.counter == 0) {
          widget.flag = 0;
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Gap(10),
          Container(
            padding: EdgeInsets.all(18),
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.flag == 1
                  ? AppColor.primaryColor
                  : Color.fromARGB(255, 25, 26, 26),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
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
                SizedBox(
                  height: 10,
                ),
                //counter of azkar
                Container(
                  width: 350,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: (widget.flag == 1)
                        ? AppColor.primaryColor
                        : Color(0xff3f826d),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          //share button
                          // Share.share(widget.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: (widget.flag == 1)
                              ? Colors.transparent
                              : Color(0xff1d201f),
                          elevation: 0,
                          shape: CircleBorder(
                            side: BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons.share,
                          color: (widget.flag == 1)
                              ? Color.fromARGB(255, 230, 228, 242)
                              : Color(0xffe1e6e1),
                        ),
                      ),
                      Text(
                        "مشاركة",
                        style: TextStyle(
                          fontFamily: 'cairoNormal',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                        child: VerticalDivider(
                          color: Colors.white,
                          width: 20,
                          thickness: 2,
                        ),
                      ),
                      widget.flag == 1 //if flag = 1 , so make
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _decrementCounter();
                                  },
                                  child: Text(
                                    "${widget.counter}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 21),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(0, 239, 97, 97),
                                    elevation: 0,
                                    shape: CircleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "التكرار",
                                  style: TextStyle(
                                    fontFamily: 'cairoNormal',
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            )
                          : Container(
                              //i think solution are here

                              width: 150,
                              child: Text(
                                "تم",
                                style: TextStyle(
                                  fontFamily: 'cairoNormal',
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/** 
 * 
 * 
 * 
 * 
 * Container(
      width: 350,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: (widget.flag == 1) ? primary : Color(0xff3f826d),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  (widget.flag == 1) ? Colors.transparent : Color(0xff1d201f),
              elevation: 0,
              shape: CircleBorder(
                side: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.white,
                ),
              ),
            ),
            child: Icon(
              Icons.share,
              color: (widget.flag == 1)
                  ? Color.fromARGB(255, 230, 228, 242)
                  : Color(0xffe1e6e1),
            ),
          ),
          Text(
            "مشاركة",
            style: GoogleFonts.cairo(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: (widget.flag == 1)
                  ? Color.fromARGB(255, 230, 228, 242)
                  : Color(0xffe1e6e1),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
            child: VerticalDivider(
              color: Colors.white,
              width: 20,
              thickness: 2,
            ),
          ),
          widget.flag == 1 //if flag = 1 , so make
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _decrementCounter();
                      },
                      child: Text("${widget.counter}"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 239, 97, 97),
                        elevation: 0,
                        shape: CircleBorder(
                          side: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "التكرار",
                      style: GoogleFonts.cairo(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 230, 228, 242),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                )
              : Container(
                  //i think solution are here

                  width: 150,
                  child: Text(
                    "تم",
                    style: GoogleFonts.cairo(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
        ],
      ),
    );**/
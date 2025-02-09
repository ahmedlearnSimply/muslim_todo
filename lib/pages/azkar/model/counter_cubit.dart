// import 'package:flutter/material.dart';
// import 'package:muslim_todp/core/colors/app_color.dart';
// import 'package:muslim_todp/widgets/counter_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class _CounterScreenState extends State<CounterScreen> {
//   late SharedPreferences prefs;

//   @override
//   void initState() {
//     super.initState();
//     _loadCounter();
//   }

//   // Load counter value from SharedPreferences
//   Future<void> _loadCounter() async {
//     prefs = await SharedPreferences.getInstance();
//     int? savedCounter = prefs.getInt('counter_${widget.text}');
//     String? lastSavedDate = prefs.getString('counter_date_${widget.text}');

//     // Get today's date
//     String todayDate = DateTime.now().toString().split(' ')[0];

//     if (lastSavedDate == todayDate && savedCounter != null) {
//       setState(() {
//         widget.counter = savedCounter;
//       });
//     } else {
//       // Reset counter for a new day
//       await prefs.setInt('counter_${widget.text}', widget.counter);
//       await prefs.setString('counter_date_${widget.text}', todayDate);
//     }
//   }

//   // Save counter value to SharedPreferences
//   Future<void> _saveCounter() async {
//     await prefs.setInt('counter_${widget.text}', widget.counter);
//     await prefs.setString(
//         'counter_date_${widget.text}', DateTime.now().toString().split(' ')[0]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isCompleted = widget.counter == 0;

//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(18),
//             decoration: BoxDecoration(
//               color: isCompleted ? Colors.grey : AppColor.primaryColor,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: Colors.white, width: 1),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   widget.text,
//                   style: TextStyle(
//                     fontFamily: 'cairoNormal',
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 10),
//                 _buildCounterRow(isCompleted),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCounterRow(bool isCompleted) {
//     return Container(
//       width: 350,
//       height: 55,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: isCompleted ? Color(0xff3f826d) : AppColor.background,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             icon: Icon(Icons.share, color: Colors.white),
//             onPressed: () {
//               // Share functionality
//             },
//           ),
//           Text("مشاركة",
//               style: TextStyle(
//                   fontFamily: 'cairoNormal',
//                   fontSize: 24,
//                   color: Colors.white)),
//           VerticalDivider(color: Colors.white, width: 20, thickness: 2),
//           if (!isCompleted)
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.remove, color: Colors.white),
//                   onPressed: () {
//                     if (widget.counter > 0) {
//                       setState(() {
//                         widget.counter--;
//                         widget.onDecrement();
//                       });
//                       _saveCounter(); // Save counter after decrement
//                     }
//                   },
//                 ),
//                 Text("${widget.counter} ",
//                     style: TextStyle(fontSize: 21, color: Colors.white)),
//                 Text("التكرار",
//                     style: TextStyle(
//                         fontFamily: 'cairoNormal',
//                         fontSize: 24,
//                         color: Colors.white)),
//               ],
//             )
//           else
//             Text("تم",
//                 style: TextStyle(
//                     fontFamily: 'cairoNormal',
//                     fontSize: 24,
//                     color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }

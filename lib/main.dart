// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:muslim_todp/core/services/app_local_storage.dart';
// import 'package:muslim_todp/pages/home_page.dart';
// import 'package:muslim_todp/widgets/bottom_nav_bar.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   await Hive.openBox('user');
//   AppLocalStorage.init();
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: NavBarWidget(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_todp/core/services/app_local_storage.dart';
import 'package:muslim_todp/pages/home_page.dart';
import 'package:muslim_todp/widgets/bottom_nav_bar.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muslim Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavBarWidget(),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';
import 'package:muslim_todp/pages/home_page.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int currentPage = 0;
  List<Widget> pages = [
    const HomePage(),
    const Center(child: Text("Azkar")),
    const Center(child: Text("states")),
    const Center(child: Text("مسبحه")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a Stack to overlay the bottom navigation bar on top of the content
      body: Stack(
        children: [
          // Display the selected page
          pages[currentPage],

          // Bottom Navigation Bar (positioned at the bottom of the screen)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                child: BottomNavigationBar(
                  backgroundColor: AppColor.primaryColor,
                  elevation: 0,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: currentPage,
                  onTap: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        AppImages.homeSvg,
                        width: 35,
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        AppImages.azkarSvg,
                        width: 40,
                      ),
                      label: "اذكار",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        AppImages.stateSvg,
                        width: 40,
                      ),
                      label: "Compass",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        AppImages.praySvg,
                        width: 40,
                      ),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

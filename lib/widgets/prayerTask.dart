import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_todp/core/assets/app_images.dart';
import 'package:muslim_todp/core/colors/app_color.dart';

class PrayerCard extends StatelessWidget {
  final String prayerName;
  final VoidCallback onTap;
  final bool isPrayerDone;
  String image;

  PrayerCard({
    Key? key,
    required this.prayerName,
    required this.image,
    required this.onTap,
    required this.isPrayerDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Gap(10),
                  SvgPicture.asset(
                    image,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 60,
                  ),
                  const Gap(20),
                  Text(
                    prayerName,
                    style: const TextStyle(
                      fontFamily: 'cairo',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColor.secondary,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Icon(
                    isPrayerDone
                        ? Icons.battery_charging_full_rounded
                        : Icons.battery_2_bar_rounded,
                    color: isPrayerDone ? Colors.green : Colors.red,
                    size: 60,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

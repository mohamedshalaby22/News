import 'package:best_design/constants/constant.dart';
import 'package:best_design/controller/BottomNav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GetBuilder<BottomNavigationBarController>(
      init: Get.find<BottomNavigationBarController>(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            unselectedItemColor: isDark ? Colors.white : Colors.grey.shade500,
            currentIndex: controller.currentIndex,
            onTap: (value) {
              controller.changeIndex(value);
            },
            items: controller.items),
        body: controller.screens[controller.currentIndex],
      ),
    );
  }
}

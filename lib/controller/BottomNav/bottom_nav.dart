import 'package:best_design/views/Screens/business.dart';
import 'package:best_design/views/Screens/health.dart';
import 'package:best_design/views/Screens/science.dart';
import 'package:best_design/views/Screens/sports.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BottomNavigationBarController extends GetxController {
  List<Widget> screens = [
    const Business(),
    const Health(),
    const Sports(),
    const Science(),
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.location_city_rounded), label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.spa_rounded), label: 'Health'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_soccer_rounded), label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.psychology_rounded), label: 'Science'),
  ];
  int currentIndex = 0;
  void changeIndex(int value) {
    currentIndex = value;
    update();
  }
}

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SkeltonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void onInit() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    controller.repeat();
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

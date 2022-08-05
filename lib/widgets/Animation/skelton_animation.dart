// ignore_for_file: must_be_immutable, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:best_design/controller/AnimationSkel/skelton_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Skelton extends StatelessWidget {
  Skelton({Key, required this.width, required this.height, key})
      : super(key: key);
  double width, height;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SkeltonController>(
      init: Get.find<SkeltonController>(),
      builder: (skeltonController) => Center(
          child: AnimatedBuilder(
              animation: skeltonController.controller,
              builder: (context, _) {
                return Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.grey.withOpacity(0.040),
                            Colors.white,
                            Colors.grey.withOpacity(0.040),
                          ],
                          stops: [
                            0.0,
                            skeltonController.controller.value,
                            1.0
                          ])),
                );
              })),
    );
  }
}

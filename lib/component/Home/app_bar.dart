import 'package:best_design/constants/constant.dart';
import 'package:best_design/controller/Api/news_controller.dart';
import 'package:best_design/views/Details/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: Get.find<NewsController>(),
      builder: (controller) => AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const SearchScreen(), transition: Transition.zoom);
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              )),
          Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Transform.scale(
                scale: 0.9,
                child: CupertinoSwitch(
                    activeColor: primaryColor,
                    value: controller.swithcValue,
                    onChanged: (bool value) {
                      controller.changeSwitch(value);
                    }),
              )),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'T',
                  style: GoogleFonts.libreBaskerville(
                      textStyle: TextStyle(
                          color: primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold))),
              TextSpan(
                  text: 'oday',
                  style: GoogleFonts.libreBaskerville(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold))),
            ])),
          ],
        ),
      ),
    );
  }
}

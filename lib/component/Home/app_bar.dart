import 'package:best_design/component/Home/rich_text.dart';
import 'package:best_design/constants/constant.dart';
import 'package:best_design/controller/Api/news_controller.dart';
import 'package:best_design/theme/theme_services.dart';
import 'package:best_design/views/Details/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                scale: 0.8,
                child: CupertinoSwitch(
                    trackColor: Colors.black,
                    activeColor: primaryColor,
                    value: ThemeServices().isSavedDarkMode(),
                    onChanged: (value) {
                      ThemeServices().changeThemeMode();
                    }),
              )),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichTextWidget(
              text1: 'T',
              text2: 'oday',
            ),
          ],
        ),
      ),
    );
  }
}

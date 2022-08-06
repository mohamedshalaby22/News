import 'package:best_design/constants/constant.dart';
import 'package:best_design/controller/Api/news_controller.dart';
import 'package:best_design/theme/theme_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // bool _value = false;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CupertinoSwitch(
            trackColor: Colors.black,
            activeColor: primaryColor,
            value: ThemeServices().isSavedDarkMode(),
            onChanged: (value) {
              ThemeServices().changeThemeMode();
            }),
      ),
    );
  }
}

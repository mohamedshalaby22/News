import 'package:flutter/material.dart';

String defaultImage =
    'https://th.bing.com/th/id/R.9d057069f19faa757634710859a3a250?rik=aXQSS1UlwVPX%2fQ&pid=ImgRaw&r=0';
Color primaryColor = Colors.orange;

void changeThemeColors(context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

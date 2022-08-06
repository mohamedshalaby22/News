// ignore_for_file: must_be_immutable

import 'package:best_design/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RichTextWidget extends StatelessWidget {
  RichTextWidget({
    Key? key,
    required this.text1,
    required this.text2,
    this.size1 = 35,
    this.size2 = 35,
  }) : super(key: key);

  String text1, text2;
  double size1, size2;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: text1,
          style: GoogleFonts.libreBaskerville(
              textStyle: TextStyle(
                  color: primaryColor,
                  fontSize: size1,
                  fontWeight: FontWeight.bold))),
      TextSpan(
          text: text2,
          style: GoogleFonts.libreBaskerville(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: size2,
                  fontWeight: FontWeight.bold))),
    ]));
  }
}

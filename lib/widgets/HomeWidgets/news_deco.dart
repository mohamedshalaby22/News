// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsContainer extends StatelessWidget {
  NewsContainer({
    Key? key,
    required this.image,
    required this.text,
    required this.date,
    this.id = 'value',
  }) : super(key: key);

  String image, text, date, id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment.topLeft,
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 50,
              left: 15,
              bottom: 5,
            ),
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                width: 130,
                height: 140,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill)),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5, top: 10),
                      child: Text(
                        text,
                        style: GoogleFonts.libreBaskerville(
                            textStyle: TextStyle(
                                color: Colors.black.withOpacity(0.70),
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                                fontSize: 16)),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Positioned(bottom: 20, left: 157, child: Text(date))
        ],
      ),
    );
  }
}

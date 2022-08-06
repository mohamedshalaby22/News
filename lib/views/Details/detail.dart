// ignore_for_file: must_be_immutable
import 'package:best_design/component/Home/rich_text.dart';
import 'package:best_design/constants/constant.dart';
import 'package:best_design/models/model.dart';
import 'package:best_design/views/Details/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetail extends StatelessWidget {
  NewsModel? newsModel;
  NewsDetail({Key? key, this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              newsModel!.urlToImage ?? defaultImage))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 20,
                ),
                child: Column(
                  children: [
                    RichTextWidget(
                      text1: 'D',
                      text2: 'escription',
                      size1: 25,
                      size2: 25,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      newsModel!.description ??
                          'India\'s financial crime-fighting agency said on Friday it had frozen the assets of WazirX, linked to the world\'s  largest digital currency exchange Binance, as part of its investigation into suspected violation of foreign exchange regulations.',
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichTextWidget(
                          text1: 'B',
                          text2: 'y',
                          size1: 25,
                          size2: 25,
                        ),
                        Text(
                          newsModel!.source!.name ?? 'Fox Business',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichTextWidget(
                      text1: 'C',
                      text2: 'ontent',
                      size1: 25,
                      size2: 25,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      newsModel!.content ??
                          'Just how much content has Warner Bros. Discovery axed since the WarnerMedia merger just a few months ago?  million worth. The company disclosed in a regulatory filing Friday that it has taken a … ',
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: BottomAppBar(
            color: Colors.transparent,
            elevation: 20,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  primary: primaryColor,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  Get.to(() => WebViewPage(
                        url: newsModel!.url.toString(),
                      ));
                },
                child: Text('Open in browser',
                    style: GoogleFonts.libreBaskerville(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)))),
          ),
        ));
  }
}

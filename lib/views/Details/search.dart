import 'package:best_design/component/search/search_field.dart';
import 'package:best_design/constants/constant.dart';
import 'package:best_design/controller/Api/news_controller.dart';
import 'package:best_design/widgets/HomeWidgets/news_deco.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.find<NewsController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text.rich(TextSpan(children: [
          TextSpan(
              text: 'S',
              style: GoogleFonts.libreBaskerville(
                  textStyle: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold))),
          TextSpan(
              text: 'earch',
              style: GoogleFonts.libreBaskerville(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold))),
        ])),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.red));
        } else {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const SearchField(),
              if (controller.newsSearch.isEmpty)
                Expanded(
                  child: Center(
                    child: controller.newsSearch.isEmpty &&
                            controller.text.text.isNotEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/not_found.png'),
                              const Text(
                                'No Result Found',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.allNews.length,
                            itemBuilder: (context, index) =>
                                SingleChildScrollView(
                                  child: NewsContainer(
                                    image:
                                        controller.allNews[index].urlToImage ??
                                            defaultImage,
                                    text: controller.allNews[index].title
                                        .toString(),
                                    date: controller.allNews[index].publishedAt
                                        .toString(),
                                    id: controller.allNews[index].source!.id
                                        .toString(),
                                  ),
                                )),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.newsSearch.length,
                      itemBuilder: (context, index) => SingleChildScrollView(
                            child: NewsContainer(
                              image: controller.newsSearch[index].urlToImage ??
                                  defaultImage,
                              text:
                                  controller.newsSearch[index].title.toString(),
                              date: controller.newsSearch[index].publishedAt
                                  .toString(),
                              id: controller.newsSearch[index].source!.id
                                  .toString(),
                            ),
                          )),
                ),
            ],
          );
        }
      }),
    );
  }
}

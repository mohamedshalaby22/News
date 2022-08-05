import 'package:flutter/material.dart';
import 'package:best_design/component/Home/app_bar.dart';
import 'package:best_design/component/Home/carousel.dart';
import 'package:best_design/constants/constant.dart';
import 'package:best_design/controller/Api/news_controller.dart';
import 'package:best_design/widgets/HomeWidgets/news_deco.dart';
import 'package:get/get.dart';

class Health extends StatelessWidget {
  const Health({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.find<NewsController>();
    return Scaffold(
        appBar: const AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const CarouselWidget(),
              Obx(() {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator(
                      color: Colors.transparent);
                } else {
                  return Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.newshealth.length,
                        itemBuilder: (context, index) => SingleChildScrollView(
                              child: NewsContainer(
                                image:
                                    controller.newshealth[index].urlToImage ??
                                        defaultImage,
                                text: controller.newshealth[index].title
                                    .toString(),
                                date: controller.newshealth[index].publishedAt
                                    .toString(),
                              ),
                            )),
                  );
                }
              })
            ],
          ),
        ));
  }
}

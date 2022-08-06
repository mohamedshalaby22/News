import 'package:best_design/views/Details/detail.dart';
import 'package:flutter/material.dart';
import 'package:best_design/component/Home/app_bar.dart';
import 'package:best_design/component/Home/carousel.dart';
import 'package:best_design/constants/constant.dart';
import 'package:best_design/controller/Api/news_controller.dart';
import 'package:best_design/widgets/HomeWidgets/news_deco.dart';
import 'package:get/get.dart';

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

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
                        itemCount: controller.newsscience.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Get.to(
                                    () => NewsDetail(
                                          newsModel:
                                              controller.newsscience[index],
                                        ),
                                    transition: Transition.leftToRight);
                              },
                              child: SingleChildScrollView(
                                child: NewsContainer(
                                  image: controller
                                          .newsscience[index].urlToImage ??
                                      defaultImage,
                                  text: controller.newsscience[index].title
                                      .toString(),
                                  date: controller
                                      .newsscience[index].publishedAt
                                      .toString(),
                                  id: '5',
                                ),
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

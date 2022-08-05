import 'package:best_design/constants/constant.dart';
import 'package:best_design/controller/Api/news_controller.dart';
import 'package:best_design/widgets/Animation/loading_widget.dart';
import 'package:best_design/widgets/HomeWidgets/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.find<NewsController>();
    return Obx(() {
      if (controller.isLoading.value) {
        return const SkeltonLaoding();
      } else {
        return SizedBox(
          height: 235,
          child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.teslaNews.length,
              itemBuilder: ((context, index) => ScrollableImage(
                  image: controller.teslaNews[index].urlToImage ?? defaultImage,
                  avatar:
                      controller.teslaNews[index].urlToImage ?? defaultImage,
                  text: controller.teslaNews[index].source!.name.toString(),
                  publishAt:
                      controller.teslaNews[index].publishedAt.toString()))),
        );
      }
    });
  }
}

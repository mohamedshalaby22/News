import 'package:best_design/controller/Api/news_controller.dart';
import 'package:best_design/controller/AnimationSkel/skelton_controller.dart';
import 'package:best_design/controller/BottomNav/bottom_nav.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController());

    Get.lazyPut(() => SkeltonController());
    Get.lazyPut(() => BottomNavigationBarController());
  }
}

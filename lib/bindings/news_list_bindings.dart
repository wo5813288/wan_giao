
import 'package:get/get.dart';
import 'package:wan_android/controller/news/news_controller.dart';

class NewsListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController());
  }

}
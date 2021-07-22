
import 'package:get/get.dart';
import 'package:wan_android/controller/news/news_content_detail_controller.dart';
import 'package:wan_android/controller/news/news_controller.dart';

class NewsContentBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NewsContentDetailController());
  }

}
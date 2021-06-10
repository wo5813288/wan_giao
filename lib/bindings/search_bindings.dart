import 'package:get/get.dart';
import 'package:wan_android/controller/search_controller.dart';

class SearchBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }

}
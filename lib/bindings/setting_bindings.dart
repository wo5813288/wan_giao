
import 'package:get/get.dart';
import 'package:wan_android/controller/theme_controller.dart';

class ThemeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
  }

}
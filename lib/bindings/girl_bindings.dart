
import 'package:get/get.dart';
import 'package:wan_android/controller/girl/girl_controller.dart';

class GirlBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GirlController());
  }

}
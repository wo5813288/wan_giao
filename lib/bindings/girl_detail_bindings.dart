import 'package:get/get.dart';
import 'package:wan_android/controller/girl/girl_detail_controller.dart';

class GirlDetailBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GirlDetailController());
  }

}
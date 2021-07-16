
import 'package:get/get.dart';
import 'package:wan_android/controller/person/express_delivery_controller.dart';

class ExpressDeliveryBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ExpressDeliveryController());
  }

}

import 'package:get/get.dart';
import 'package:wan_android/controller/device_info_controller.dart';

class DeviceInfoBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DeviceInfoController());
  }

}
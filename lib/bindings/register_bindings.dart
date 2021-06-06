
import 'package:get/get.dart';
import 'package:wan_android/controller/login_controller.dart';
import 'package:wan_android/controller/register_controller.dart';

class RegisterBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }

}
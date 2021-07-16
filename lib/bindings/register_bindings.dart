
import 'package:get/get.dart';
import 'package:wan_android/controller/login/login_controller.dart';
import 'package:wan_android/controller/login/register_controller.dart';

class RegisterBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }

}
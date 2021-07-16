import 'package:get/get.dart';
import 'package:wan_android/controller/person/person_share_controller.dart';

class PersonShareBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PersonShareController());
  }

}
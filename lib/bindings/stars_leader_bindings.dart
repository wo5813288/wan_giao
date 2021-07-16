
import 'package:get/get.dart';
import 'package:wan_android/controller/person/starts_leader_controller.dart';

class StarsLeaderBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StarsLeaderController());
  }

}
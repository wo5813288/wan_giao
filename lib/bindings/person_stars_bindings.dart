
import 'package:get/get.dart';
import 'package:wan_android/controller/person/person_stars_controller.dart';

class PersonStarsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PersonStarsController());
  }

}
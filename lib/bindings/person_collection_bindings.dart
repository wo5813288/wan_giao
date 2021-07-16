
import 'package:get/get.dart';
import 'package:wan_android/controller/person/person_collection_controller.dart';

class PersonCollectionBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PersonCollectionController());
  }
}
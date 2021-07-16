
import 'package:get/get.dart';
import 'package:wan_android/controller/person/todo_controller.dart';

class ToDoBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ToDoController());
  }

}
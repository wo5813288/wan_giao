
import 'package:get/get.dart';
import 'package:wan_android/controller/message_list_controller.dart';

class MessageListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MessageListController());
  }
}
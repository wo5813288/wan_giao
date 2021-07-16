
import 'package:get/get.dart';
import 'package:wan_android/controller/person/message_list_readed_controller.dart';

class MessageListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MessageListController());
  }
}
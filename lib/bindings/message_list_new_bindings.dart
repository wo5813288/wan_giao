
import 'package:get/get.dart';
import 'package:wan_android/controller/person/message_list_new_controller.dart';

class MessageListNewBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MessageListNewController());
  }
}
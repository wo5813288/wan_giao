
import 'package:get/get.dart';
import 'package:wan_android/controller/artilce_collection_controller.dart';

class ArticleCollectionBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleCollectionController());
  }

}
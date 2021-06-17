import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/controller/base_getx_controller.dart';



abstract class BaseGetXControllerWithRefesh extends BaseGetXController {
  RefreshController _refreshController ;
  RefreshController get refreshController =>_refreshController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _refreshController= RefreshController(initialRefresh: false);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _refreshController.dispose();
  }
}

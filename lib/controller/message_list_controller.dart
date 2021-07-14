import 'package:get/get.dart';
import 'package:wan_android/bean/message_data.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/base_getx_controller_with_refresh.dart';
import 'package:wan_android/http/http_manager.dart';
class MessageListController extends BaseGetXControllerWithRefesh{
  var _messageItems = <Message>[].obs;
  List<Message> get messageItems => _messageItems;
  int _pageIndex = 1;
  ///获取已读消息列表
  getMessageList(bool isShowLoading, {bool refresh}){
    handleRequest(HttpManager.instance.get('message/lg/readed_list/$_pageIndex/json'), isShowLoading, (value){
      var result = MessageData.fromJson(value).data;
      int curPage = result.curPage;
      int pageCount = result.pageCount;
      if (curPage == 1) {
        _messageItems.clear();
      }
      _messageItems.addAll(result.datas);
      if (curPage == 1 && result.datas.length == 0) {
        loadState.value = LoadState.EMPTY;
      } else if (curPage == pageCount) {
        loadState.value = LoadState.NO_MORE;
        refreshController.loadNoData();
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController.loadComplete();
        refreshController.refreshCompleted(resetFooterState: true);
        _pageIndex++;
      }
    }, failure: (error) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }


  @override
  void refresh() {
    _pageIndex = 1;
    getMessageList(false, refresh: true);
  }

  @override
  void initData(bool isShowLoading) {
    _pageIndex = 1;
    getMessageList(isShowLoading);
  }

}
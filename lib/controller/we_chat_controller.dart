
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/we_chat_data.dart';
import 'package:wan_android/controller/base_getx_controller_with_refresh.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:get/get.dart';
class WeChatController extends BaseGetXControllerWithRefesh{
  var _authorId = "".obs;
  var _articleItems =<ArticleItem>[].obs;

  List<ArticleItem> get articleItems => _articleItems;

  int pageIndex = 1;

  void setAuthorId(String id){
    _authorId.value = id;
  }

  var _weChats = <WeChat>[].obs;

  List<WeChat> get weChats => _weChats;

  @override
  void onInit() {
    super.onInit();
    ever(Get.find<AppState>().loginState, (callBack) {
      //每次登录状态发生变化，都要重新请求广场数据
      initData(true);
    });
  }

  void getWehChatData() async {
    handleRequest(HttpManager.instance.get(RequestApi.WE_CHAT), true, (value){
      _weChats.value=WeChatData.fromJson(value).data;
      loadState.value=_weChats.isEmpty?LoadState.EMPTY:LoadState.SUCCESS;
    });
  }

  void getArticleByAuthor(bool isShowLoading,{bool refresh}) async {
    handleRequest(
        HttpManager.instance.get('wxarticle/list/$_authorId/$pageIndex/json',list: true,refresh:refresh), isShowLoading, (value) {
      var result = ArticleData.fromJson(value).data;
      //当前页码
      int curPage = result.curPage;
      //总页数
      int pageCount = result.pageCount;

      if (pageIndex == 1) {
        _articleItems.clear();
      }
      //文章列表数据
      _articleItems.addAll(result.datas);
      if (curPage == 1 && result.datas.length == 0) {
        loadState.value=LoadState.EMPTY;
      } else if (curPage == pageCount) {
        loadState.value=LoadState.NO_MORE;
        refreshController.loadNoData();
        refreshController.refreshCompleted(resetFooterState: true);
      } else {
        loadState.value=LoadState.SUCCESS;
        refreshController.loadComplete();
        refreshController.refreshCompleted(resetFooterState: true);
        pageIndex++;
      }
    }, failure: (error) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex = 1;
    getArticleByAuthor(isShowLoading);
  }
  @override
  void refresh() {
    pageIndex = 1;
    getArticleByAuthor(false,refresh: true);
  }
}
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/hot_key_data.dart';
import 'package:wan_android/compents/constant.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/base/base_getx_controller.dart';
import 'package:wan_android/controller/base/base_getx_controller_with_refresh.dart';
import 'package:wan_android/http/http_manager.dart';

class SearchController extends BaseGetXControllerWithRefesh {
  var _articleItems = <ArticleItem>[].obs;
  var _searchHistory = <String>[].obs;
  var _hotKeyList = <HotKey>[].obs;
  String _queryKey = "";
  int _pageIndex = 0;
  var _isSearching = false.obs;

  List<ArticleItem> get articleItems => _articleItems;

  List<HotKey> get hotKeyList => _hotKeyList.value;

  List<String> get searchHistory => _searchHistory.value;

  bool get isSearching => _isSearching.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //初始化的时候，开始获取搜索历史数据
    _searchHistory.value = SpUtil.getStringList(Constant.KEY_SEARCH_HISTORY, defValue: []);
  }
  void setQueryKey(String keyWords) {
    //这里记录搜索的历史
    var historyList =
        SpUtil.getStringList(Constant.KEY_SEARCH_HISTORY, defValue: []);
    if (!historyList.contains(keyWords)) {
      historyList.add(keyWords);
    }
    //搜索的历史记录重新保存在本地缓存
    SpUtil.putStringList(Constant.KEY_SEARCH_HISTORY, historyList);
    _searchHistory.value = historyList;
    _queryKey = keyWords;
  }

  void setSearching(bool searching) {
    _isSearching.value = searching;
  }

  ///获取热门搜索关键字
  void getSearchHotKey() {
    handleRequest(HttpManager.instance.get("hotkey/json"), true, (value) {
      _hotKeyList.value = HotKeyData.fromJson(value).data;
    });
  }

  ///加载更多的搜索文章
  void loadArticleBySearchKey(bool isShowLoading) {
    handleRequest(
        HttpManager.instance.post(
          "article/query/$_pageIndex/json?k=$_queryKey",
        ),
        isShowLoading, (value) {
      var result = ArticleData.fromJson(value).data;
      //当前页码
      int curPage = result.curPage;
      //总页数
      int pageCount = result.pageCount;

      if (curPage == 1) {
        _articleItems.clear();
      }
      //文章列表数据
      _articleItems.addAll(result.datas);
      if (curPage == 1 && result.datas.length == 0) {
        loadState.value = LoadState.EMPTY;
      } else if (curPage == pageCount) {
        loadState.value = LoadState.NO_MORE;
        refreshController.loadNoData();
        refreshController.refreshCompleted();
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController.loadComplete();
        _pageIndex++;
      }
    }, failure: (errorMessage) {
      refreshController.loadFailed();
    });
  }

  @override
  void initData(bool isShowLoading) {
    _pageIndex = 0;
    loadArticleBySearchKey(isShowLoading);
  }
}

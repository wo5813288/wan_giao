import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/viewmodel/base_view_model.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/hot_key_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/page/state_page.dart';

class SearchViewModel extends BaseViewModel {
  List<HotKey> _hotKeyList = [];

  List<HotKey> get hotKeyList => _hotKeyList;

  bool _isReady = false;

  bool get isReady => _isReady;

  ///获取热门搜索关键字
  void getSearchHotKey() {
    handleRequest(HttpManager.instance.get("hotkey/json"), true, (value) {
      _hotKeyList = HotKeyData.fromJson(value).data;
    });
  }

  void readySearch(bool isReady) {
    _isReady = isReady;
    notifyListeners();
  }
}

class SearchResultViewModel extends BaseViewModel {
  List<ArticleItem> _articleItems = [];

  List<ArticleItem> get articleItems => _articleItems;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;
  int pageIndex = 0;

  ///加载更多的搜索文章
  void loadArticleBySearchKey(String queryKey,bool isShowLoading) {
    handleRequest(
        HttpManager.instance.post("article/query/$pageIndex/json?k=$queryKey",), isShowLoading, (value) {
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
        setLoadState(LoadState.EMPTY);
      } else if (curPage == pageCount) {
        setLoadState(LoadState.NO_MORE);
        _refreshController.loadNoData();
        _refreshController.refreshCompleted();
      } else {
        setLoadState(LoadState.SUCCESS);
        _refreshController.loadComplete();
        pageIndex++;
      }
    }, failure: (errorMessage) {
      _refreshController.loadFailed();
    });
  }

  ///初始加载搜索都文章
  void initalSearchArticle(String queryKey) {
    pageIndex = 0;
    loadArticleBySearchKey(queryKey,true);
  }
}

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/base_view_model.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/bean/top_article_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/page/state_page.dart';

class HomeViewModel extends BaseViewModel {
  List<BannerItem> _bannerItems = [];

  List<BannerItem> get bannerItems => _bannerItems;

  List<ArticleItem> _articleItems = [];

  List<ArticleItem> get articleItems => _articleItems;
  List<ArticleItem> _topArticleItems = [];

  List<ArticleItem> get topArticleItems => _topArticleItems;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;
  int pageIndex = 0;

  ///获取Banner数据
  void getHomeBanner() {
    handleRequest(HttpManager.instance.get(RequestApi.homeBanner), (value) {
      var items = BannerData.fromJson(value).data;
      _bannerItems = items;
    });
  }

  ///获取首页列表数据
  void getHomeArticle(bool showLoading) async {
    if (showLoading) {
      setLoadState(LoadState.LOADING);
    }
    handleRequest(HttpManager.instance.get('article/list/$pageIndex/json'),
        (value) {
      var result = ArticleData.fromJson(value).data;
      //当前页码
      int curPage = result.curPage;
      //总页数
      int pageCount = result.pageCount;

      if (pageIndex == 0) {
        _articleItems.clear();
      }
      //文章列表数据
      _articleItems.addAll(result.datas);
      if (curPage == 0 && result.datas.length == 0) {
        setLoadState(LoadState.EMPTY);
      } else if (curPage == pageCount) {
        setLoadState(LoadState.NO_MORE);
        _refreshController.loadNoData();
      } else {
        setLoadState(LoadState.SUCCESS);
        _refreshController.loadComplete();
        _refreshController.refreshCompleted(resetFooterState: true);
        pageIndex++;
      }
    },
      failure: (errorMessage){
        _refreshController.loadFailed();
        _refreshController.refreshFailed();
      }
    );
  }

  ///获取首页置顶文章
  void getHomeTopArticle() async {
    handleRequest(HttpManager.instance.get(RequestApi.homeTop), (value) {
      _topArticleItems = TopArticleData.fromJson(value).data;
    });
  }

  ///刷新数据
  void refresh(bool showLoading) async {
    pageIndex = 0;
    getHomeBanner();
    getHomeTopArticle();
    getHomeArticle(showLoading);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _refreshController.dispose();
  }
}

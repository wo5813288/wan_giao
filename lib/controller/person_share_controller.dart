import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/share_article_data.dart';
import 'package:wan_android/controller/base_getx_controller_with_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/page/state_page.dart';

class PersonShareController extends BaseGetXControllerWithRefesh {
  var _articleItems = <ArticleItem>[].obs;

  List<ArticleItem> get articleItems => _articleItems;
  int pageIndex = 1;

  ///获取收藏的文章列表
  void getPersonShareArticle(bool isLoading, {bool refresh}) {
    handleRequest(
        HttpManager.instance.get("user/lg/private_articles/$pageIndex/json",
            refresh: refresh, list: true),
        isLoading, (value) {
      var result = ShareArticleData.fromJson(value).data;
      int curPage = result.curPage;
      int pageCount = result.pageCount;
      if (curPage == 1) {
        //首页
        _articleItems.clear();
      }
      _articleItems.addAll(result.datas);
      if (curPage == 1 && result.datas.length == 0) {
        loadState.value = LoadState.EMPTY;
      } else if (curPage == pageCount) {
        loadState.value = LoadState.NO_MORE;
        refreshController.loadNoData();
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController.loadComplete();
        pageIndex++;
      }
      refreshController.refreshCompleted(resetFooterState: true);
    }, failure: (errorMessage) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex = 0;
    getPersonShareArticle(isShowLoading);
  }

  @override
  void refresh() {
    pageIndex = 0;
    getPersonShareArticle(false, refresh: true);
  }
}

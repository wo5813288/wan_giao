import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/viewmodel/base_view_model.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/page/state_page.dart';

class SquareViewModel extends BaseViewModelWithRefresh{
  List<ArticleItem> _articleItems = [];

  List<ArticleItem> get articleItems => _articleItems;

  int pageIndex = 0;

  ///获取问答列表数据
  void getSquareArticle(bool isShowLoading,{bool refresh=false}) {
    handleRequest(HttpManager.instance.get('user_article/list/$pageIndex/json',list: true,refresh: refresh),isShowLoading,
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
            refreshController.loadNoData();
          } else {
            setLoadState(LoadState.SUCCESS);
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
  void refresh(){
    pageIndex = 0;
    getSquareArticle(false,refresh: true);
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex = 0;
    getSquareArticle(isShowLoading);
  }
}
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/base_view_model.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/bean/question_data.dart';
import 'package:wan_android/bean/top_article_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/page/state_page.dart';

class QuestionViewModel extends BaseViewModel {
  List<QuestionItem> _questionItems = [];

  List<QuestionItem> get questionItems => _questionItems;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;
  int pageIndex = 0;

  ///获取问答列表数据
  void getQuestion(bool isShowLoading) {
    handleRequest(HttpManager.instance.get('wenda/list/$pageIndex/json'),isShowLoading,
        (value) {
      var result = QuestionData.fromJson(value).data;
      //当前页码
      int curPage = result.curPage;
      //总页数
      int pageCount = result.pageCount;

      if (pageIndex == 0) {
        _questionItems.clear();
      }
      //文章列表数据
      _questionItems.addAll(result.datas);
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
    }, failure: (error) {
      _refreshController.loadFailed();
      _refreshController.refreshFailed();
    });
  }

  void refresh(){
    pageIndex = 0;
    getQuestion(false);
  }
}

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/viewmodel/base_view_model.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/we_chat_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/page/state_page.dart';

class WeChatTabData extends BaseViewModel {
  List<WeChat> _weChats = [];

  List<WeChat> get weChats => _weChats;

  void getWehChatData() async {
    handleRequest(HttpManager.instance.get(RequestApi.weChat), true, (value){
      _weChats=WeChatData.fromJson(value).data;
      setLoadState(_weChats.isEmpty?LoadState.EMPTY:LoadState.SUCCESS);
    });
  }
}

class WeChatViewModel extends BaseViewModel {
  List<ArticleItem> _articleItems = [];

  List<ArticleItem> get articleItems => _articleItems;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;
  int pageIndex = 1;

  ///获取问答列表数据
  void getArticleByAuthor(bool isShowLoading, String authorId) async {
    handleRequest(
        HttpManager.instance.get('wxarticle/list/$authorId/$pageIndex/json'),
        isShowLoading, (value) {
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
        setLoadState(LoadState.EMPTY);
      } else if (curPage == pageCount) {
        setLoadState(LoadState.NO_MORE);
        _refreshController.loadNoData();
        _refreshController.refreshCompleted(resetFooterState: true);
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

  void refresh(String authorId) {
    pageIndex = 1;
    getArticleByAuthor(false, authorId);
  }
}

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/viewmodel/base_view_model.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/tip_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/page/state_page.dart';

class SystemViewModel extends BaseViewModel{
  List<TipItem> _tipItems = [];
  List<TipItem> get tipItems =>_tipItems;
  void getSystemData(){
    handleRequest(HttpManager.instance.get(RequestApi.systemApi), true, (value){
      _tipItems=TipData.fromJson(value).data;
      setLoadState(_tipItems.length>0?LoadState.SUCCESS:LoadState.EMPTY);
    });
  }
}

class SystemContentViewModel extends BaseViewModel{
  List<ArticleItem> _articleItems = [];

  List<ArticleItem> get articleItems => _articleItems;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;
  int pageIndex = 0;

  ///获取问答列表数据
  void getArticleBySystem(bool isShowLoading, String cid) async {
    handleRequest(
        HttpManager.instance.get('article/list/$pageIndex/json?cid=$cid'),
        isShowLoading, (value) {
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

  void refresh(String cid) {
    pageIndex = 0;
    getArticleBySystem(false, cid);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _refreshController.dispose();
  }
}

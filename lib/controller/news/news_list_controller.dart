
import 'package:get/get.dart';
import 'package:wan_android/bean/news_item_data.dart';
import 'package:wan_android/bean/news_type_data.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/base/base_getx_controller_with_refresh.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
class NewsListController extends BaseGetXControllerWithRefesh{

  var _newsContents = <NewsItem>[].obs;
  List<NewsItem> get newsContents =>_newsContents;
  String _newsTypesId;

  void setNewsTypeId(String id){
    _newsTypesId = id;
  }

  int _pageIndex = 1;

  ///获取对应的类型的新闻列表
  void getNewsList(bool isShowLoading, {bool refresh}){
    handleRequest(
        HttpManager.instance.get("",newUrl: RequestApi.QUERY_NEWS_LIST_BY_TYPE(_newsTypesId,_pageIndex),
            list: true, refresh: refresh),
        isShowLoading, (value) {
      var result = NewsItemData.fromJson(value).data;
      //文章列表数据
      if(_pageIndex==1){
        _newsContents.clear();
      }
      _newsContents.addAll(result);
      if (_pageIndex==1&&result.isEmpty) {
        loadState.value = LoadState.EMPTY;
        return;
      }
      if(result.isEmpty){
        loadState.value = LoadState.NO_MORE;
        refreshController.loadNoData();
        refreshController.refreshCompleted(resetFooterState: true);
        return;
      }
      loadState.value = LoadState.SUCCESS;
      refreshController.loadComplete();
      refreshController.refreshCompleted(resetFooterState: true);
      _pageIndex++;
    }, failure: (error) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }
  @override
  void initData(bool isShowLoading) {
    getNewsList(isShowLoading);
  }

  @override
  void refresh() {
    _pageIndex = 1;
    getNewsList(false);
  }
}

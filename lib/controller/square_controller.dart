
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/controller/base_getx_controller.dart';
import 'package:get/get.dart';
import 'package:wan_android/controller/base_getx_controller_with_refresh.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/page/state_page.dart';
class SquareController extends BaseGetXControllerWithRefesh{
  var _articleItems = <ArticleItem>[].obs;
  List<ArticleItem> get articleItems => _articleItems;

  int pageIndex = 0;

  @override
  void onInit() {
    super.onInit();
    ever(Get.find<AppState>().loginState, (callBack){
      //每次登录状态发生变化，都要重新请求广场数据
      initData(true);
    });
  }
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
            loadState.value=LoadState.EMPTY;
          } else if (curPage == pageCount) {
            loadState.value=LoadState.NO_MORE;
            refreshController.loadNoData();
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
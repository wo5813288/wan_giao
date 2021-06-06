import 'package:flutter/material.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/tip_data.dart';
import 'package:wan_android/controller/base_getx_controller.dart';
import 'package:get/get.dart';
import 'package:wan_android/controller/base_getx_controller_with_refresh.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/page/state_page.dart';

class SystemContentController extends BaseGetXControllerWithRefesh{
  var _articleItems = <ArticleItem>[].obs;

  List<ArticleItem> get articleItems => _articleItems;

  int pageIndex = 0;

  //当前要查询的文章类别id
  var _cid = "".obs;

  void setCid(String cid) {
    _cid.value = cid;
  }
  @override
  void onInit() {
    super.onInit();
    ever(Get.find<AppState>().loginState, (callBack) {
      //每次登录状态发生变化，都要重新请求广场数据
      initData(true);
    });
  }

  void getArticleBySystem(bool isShowLoading, {bool refresh}) async {
    handleRequest(
        HttpManager.instance.get('article/list/$pageIndex/json?cid=$_cid',
            list: true, refresh: refresh),
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
        refreshController.refreshCompleted(resetFooterState: true);
      } else {
        loadState.value = LoadState.SUCCESS;
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
  void refresh() {
    pageIndex = 0;
    getArticleBySystem(false, refresh: true);
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex = 0;
    getArticleBySystem(isShowLoading);
  }
}
class SystemController extends BaseGetXController {
  var _tipItems = <TipItem>[].obs;

  List<TipItem> get tipItems => _tipItems;


  ///获取体系相关的类别
  void getSystemData() {
    handleRequest(HttpManager.instance.get(RequestApi.SYSTEM_TREE_API), true,
        (value) {
      _tipItems.value = TipData.fromJson(value).data;
      loadState.value =
          _tipItems.length > 0 ? LoadState.SUCCESS : LoadState.EMPTY;
    });
  }

}

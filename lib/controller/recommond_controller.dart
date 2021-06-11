import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/bean/top_article_data.dart';
import 'package:wan_android/controller/base_getx_controller.dart';
import 'package:get/get.dart';
import 'package:wan_android/controller/base_getx_controller_with_refresh.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/page/state_page.dart';

class RecommendController extends BaseGetXControllerWithRefesh {
  var _bannerItems = <BannerItem>[].obs;

  List<BannerItem> get bannerItems => _bannerItems;

  var _articleItems = <ArticleItem>[].obs;

  List<ArticleItem> get articleItems => _articleItems;
  var _topArticleItems = <ArticleItem>[].obs;

  List<ArticleItem> get topArticleItems => _topArticleItems;

  int pageIndex = 0;

  @override
  void onInit() {
    super.onInit();
    ever(Get.find<AppState>().loginState, (callBack) {
      //每次登录状态发生变化，都要重新请求广场数据
      initData(true);
    });
  }

  ///获取Banner数据
  void getHomeBanner({bool refresh = false}) {
    handleRequest(
        HttpManager.instance.get(RequestApi.HOME_BANNER, refresh: refresh),
        false, (value) {
      var items = BannerData.fromJson(value).data;
      _bannerItems.value = items;
    });
  }

  ///获取首页列表数据
  void getHomeArticle(bool showLoading, {bool refresh = false}) async {
    handleRequest(
        HttpManager.instance
            .get('article/list/$pageIndex/json', refresh: refresh, list: true),
        showLoading, (value) {
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
        loadState.value = LoadState.EMPTY;
      } else if (curPage == pageCount) {
        loadState.value = LoadState.NO_MORE;
        refreshController.loadNoData();
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController.loadComplete();
        refreshController.refreshCompleted(resetFooterState: true);
        pageIndex++;
      }
    }, failure: (errorMessage) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
      if (!showLoading && pageIndex == 0) {
        showToast(errorMessage, backgroundColor: Colors.red);
      }
    });
  }

  ///获取首页置顶文章
  void getHomeTopArticle({bool refresh = false}) async {
    handleRequest(
        HttpManager.instance.get(RequestApi.HOME_TOP, refresh: refresh), false,
        (value) {
      _topArticleItems.value = TopArticleData.fromJson(value).data;
    });
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex = 0;
    getHomeBanner();
    getHomeTopArticle();
    getHomeArticle(isShowLoading);
  }

  @override
  void refresh() {
    pageIndex = 0;
    getHomeBanner(refresh: true);
    getHomeTopArticle(refresh: true);
    getHomeArticle(false, refresh: true);
  }
}

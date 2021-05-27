import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/viewmodel/base_view_model.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/bean/question_data.dart';
import 'package:wan_android/bean/top_article_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/page/state_page.dart';

class HomeViewModel extends BaseViewModelWithRefresh {
  List<BannerItem> _bannerItems = [];

  List<BannerItem> get bannerItems => _bannerItems;

  List<ArticleItem> _articleItems = [];

  List<ArticleItem> get articleItems => _articleItems;
  List<ArticleItem> _topArticleItems = [];

  List<ArticleItem> get topArticleItems => _topArticleItems;

  int pageIndex = 0;

  ///获取Banner数据
  void getHomeBanner({bool refresh =false}) {
    handleRequest(HttpManager.instance.get(RequestApi.homeBanner,refresh:refresh ),false, (value) {
      var items = BannerData.fromJson(value).data;
      _bannerItems = items;
    });
  }

  ///获取首页列表数据
  void getHomeArticle(bool showLoading,{bool refresh  = false}) async {
    handleRequest(HttpManager.instance.get('article/list/$pageIndex/json',refresh: refresh,list: true),showLoading,
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
    }, failure: (errorMessage) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
      if(!showLoading&&pageIndex==0){
        Fluttertoast.showToast(msg: errorMessage,backgroundColor: Colors.red);
      }
    });
  }

  ///获取首页置顶文章
  void getHomeTopArticle({bool refresh=false}) async {
    handleRequest(HttpManager.instance.get(RequestApi.homeTop,refresh: refresh),false, (value) {
      _topArticleItems = TopArticleData.fromJson(value).data;
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
    getHomeArticle(false,refresh: true);
  }
}

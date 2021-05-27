import 'package:flutter/cupertino.dart';
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

class QuestionViewModel extends BaseViewModelWithRefresh {
  List<QuestionItem> _questionItems = [];

  List<QuestionItem> get questionItems => _questionItems;

  int pageIndex = 1;
  ///获取问答列表数据
  void getQuestion(bool isShowLoading,{bool refresh=false}) {
    handleRequest(HttpManager.instance.get('wenda/list/$pageIndex/json',list: true,refresh: refresh),isShowLoading,
        (value) {
      var result = QuestionData.fromJson(value).data;
      //当前页码
      int curPage = result.curPage;
      //总页数
      int pageCount = result.pageCount;

      if (pageIndex == 1) {
        _questionItems.clear();
      }
      //文章列表数据
      _questionItems.addAll(result.datas);
      if (curPage == 1 && result.datas.length == 0) {
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
    pageIndex = 1;
    getQuestion(false,refresh: true);
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex = 1;
    getQuestion(isShowLoading);
  }
}

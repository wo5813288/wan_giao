import 'package:flutter/cupertino.dart';
import 'package:wan_android/bean/coin_data.dart';
import 'package:wan_android/bean/stars_leaderboadrd_data.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/base_getx_controller_with_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android/http/http_manager.dart';

class StarsLeaderController extends BaseGetXControllerWithRefesh {
  int pageIndex = 1;
  var _coins = <Coin>[].obs;

  List<Coin> get coins => _coins;
  var _offset = 0.0.obs;

  double get offset => _offset.value;
  ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  void setOffset(double off) {
    _offset.value = off;
  }

  ///获取排行榜
  void getStarsLeaderBoard(bool isShowLoading) {
    handleRequest(
        HttpManager.instance.get("coin/rank/$pageIndex/json"), isShowLoading,
        (value) {
      var result = StarsLeaderboadrdData.fromJson(value).data;
      int curPage = result.curPage;
      int pageCount = result.pageCount;
      if (curPage == 1) {
        //首页
        _coins.clear();
      }
      _coins.addAll(result.datas);
      if (curPage == 1 && result.datas.length == 0) {
        loadState.value = LoadState.EMPTY;
      } else if (curPage == pageCount) {
        loadState.value = LoadState.NO_MORE;
        refreshController.loadNoData();
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController.loadComplete();
        pageIndex++;
      }
      refreshController.refreshCompleted(resetFooterState: true);
    }, failure: (errorMessage) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }

  @override
  void refresh() {
    pageIndex = 1;
    getStarsLeaderBoard(false);
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex = 1;
    getStarsLeaderBoard(isShowLoading);
  }
}

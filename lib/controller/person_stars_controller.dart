
import 'package:wan_android/bean/coin_sign_data.dart';
import 'package:wan_android/controller/base_getx_controller_with_refresh.dart';

import 'package:get/get.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/page/state_page.dart';
class PersonStarsController extends BaseGetXControllerWithRefesh{
  var _coinSignItems = <CoinSignItem>[].obs;
  List<CoinSignItem> get coinSigItems =>_coinSignItems;
  int pageIndex = 1;
  //获取个人积分列表
  void getPersonStarts(bool isShowLoading) async{
    handleRequest(HttpManager.instance.get("lg/coin/list/$pageIndex/json"), isShowLoading, (value){
      var coinSignResult = CoinSignData.fromJson(value).data;
      int curPage = coinSignResult.curPage;
      int pageCount = coinSignResult.pageCount;
      if(curPage==1){
        //首页
        _coinSignItems.clear();
      }
      _coinSignItems.addAll(coinSignResult.datas);
      if (curPage == 1 && coinSignResult.datas.length == 0) {
        loadState.value=LoadState.EMPTY;
      } else if (curPage == pageCount) {
        loadState.value=LoadState.NO_MORE;
        refreshController.loadNoData();
      } else {
        loadState.value=LoadState.SUCCESS;
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
    pageIndex=1;
    getPersonStarts(false);
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex=1;
    getPersonStarts(isShowLoading);
  }
}
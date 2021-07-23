import 'package:wan_android/bean/girl_data.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/base/base_getx_controller_with_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';

class GirlController extends BaseGetXControllerWithRefesh {
  var _girls = <Girl>[].obs;
  var isList = false.obs;
  List<Girl> get girls => _girls;
  int _pageIndex = 1;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData(true);
  }
  void getGirls(bool isShowLoading, {bool refresh}) {
    handleRequest(
        HttpManager.instance.get("",
            newUrl: RequestApi.QUERY_GIRLS_API,
            params: {"page":_pageIndex},
            refresh: refresh,
            list: true),
        isShowLoading,
        (value) {
          //放回成功结果
          var result = GirlData.fromJson(value).data;
          //当前页码
          int curPage = result.page;
          //总页数
          int pageCount = result.totalCount;

          if (_pageIndex == 1) {
            _girls.clear();
          }
          //文章列表数据
          _girls.addAll(result.list);
          if (curPage == 1 && result.list.length == 0) {
            loadState.value = LoadState.EMPTY;
          } else if (curPage == pageCount) {
            loadState.value = LoadState.NO_MORE;
            refreshController.loadNoData();
            refreshController.refreshCompleted(resetFooterState: true);
          } else {
            loadState.value = LoadState.SUCCESS;
            refreshController.loadComplete();
            refreshController.refreshCompleted(resetFooterState: true);
            _pageIndex++;
          }
        },
        failure: (error) {
          refreshController.loadFailed();
          refreshController.refreshFailed();
        });
  }

  @override
  void initData(bool isShowLoading) {
    getGirls(isShowLoading);
  }
  @override
  void refresh() {
    _pageIndex = 1;
    getGirls(false,refresh: true);
  }
}

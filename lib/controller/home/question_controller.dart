import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/bean/question_data.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/base/base_getx_controller_with_refresh.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:get/get.dart';

class QuestionController extends BaseGetXControllerWithRefesh {
  var _questionItems = <QuestionItem>[].obs;

  List<QuestionItem> get questionItems => _questionItems;

  int pageIndex = 1;

  @override
  void onInit() {
    super.onInit();
    ever(Get.find<AppState>().loginState, (callBack) {
      //每次登录状态发生变化，都要重新请求广场数据
      initData(true);
    });
  }

  ///获取问答列表数据
  void getQuestion(bool isShowLoading, {bool refresh = false}) {
    handleRequest(
        HttpManager.instance
            .get('wenda/list/$pageIndex/json', list: true, refresh: refresh),
        isShowLoading, (value) {
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
    }, failure: (error) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }

  @override
  void refresh() {
    pageIndex = 1;
    getQuestion(false, refresh: true);
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex = 1;
    getQuestion(isShowLoading);
  }
}

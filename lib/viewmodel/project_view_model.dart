import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/viewmodel/base_view_model.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/project_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/page/state_page.dart';

///项目的类别
class ProjectTabData extends BaseViewModel {
  List<Project> _projects = [];

  List<Project> get projects => _projects;

  ///获取项目的分类
  getProjectTabs() async {
    handleRequest(HttpManager.instance.get(RequestApi.projectTags), true, (value) {
      _projects = ProjectData.fromJson(value).data;
      setLoadState(_projects.isEmpty?LoadState.EMPTY:LoadState.SUCCESS);
    });
  }
}

///项目文章列表
class ProjectViewModel extends BaseViewModel {
  List<ArticleItem> _articleItems = [];

  List<ArticleItem> get articleItems => _articleItems;
  int pageIndex = 1;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get controller => _refreshController;

  ///获取对应的文章猎豹数据
  getProjectList(bool isShowLoading, String cid) async {
    handleRequest(
        HttpManager.instance
            .get("project/list/$pageIndex/json", params: {"cid": cid}),
        isShowLoading, (value) {
      var result = ArticleData.fromJson(value).data;
      int curPage = result.curPage;
      int pageCount = result.pageCount;
      if (pageIndex == 1) {
        _articleItems.clear();
      }
      //文章列表数据
      _articleItems.addAll(result.datas);
      if (curPage == 1&& result.datas.length == 0) {
        setLoadState(LoadState.EMPTY);
      } else if (curPage == pageCount) {
        setLoadState(LoadState.NO_MORE);
        _refreshController.loadNoData();
      } else {
        setLoadState(LoadState.SUCCESS);
        _refreshController.loadComplete();
        _refreshController.refreshCompleted(resetFooterState: true);
        pageIndex++;
      }
    }, failure: (error) {
      _refreshController.loadFailed();
      _refreshController.refreshFailed();
    });
  }

  void refresh(String cid) {
    pageIndex = 1;
    getProjectList(false, cid);
  }
}

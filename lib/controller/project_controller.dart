import 'package:flutter/material.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/project_data.dart';
import 'package:wan_android/controller/base_getx_controller_with_refresh.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:get/get.dart';

class ProjectController extends BaseGetXControllerWithRefesh {
  var _projects = <Project>[].obs;

  List<Project> get projects => _projects;
  var _articleItems = <ArticleItem>[].obs;

  List<ArticleItem> get articleItems => _articleItems;

  var _cid = "".obs;
  int _pageIndex = 1;

  void setCid(String id) {
    _cid.value = id;
  }

  ///获取项目的分类
  getProjectTabs() async {
    handleRequest(HttpManager.instance.get(RequestApi.projectTags), true,
        (value) {
      _projects.value = ProjectData.fromJson(value).data;
      loadState.value = _projects.isEmpty ? LoadState.EMPTY : LoadState.SUCCESS;
    });
  }

  ///获取对应的文章猎豹数据
  getProjectList(bool isShowLoading, {bool refresh}) async {
    handleRequest(HttpManager.instance.get("project/list/$_pageIndex/json", params: {"cid": _cid.value}, list: true, refresh: refresh),
        isShowLoading, (value) {
      var result = ArticleData.fromJson(value).data;
      int curPage = result.curPage;
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
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController.loadComplete();
        refreshController.refreshCompleted(resetFooterState: true);
        _pageIndex++;
      }
    }, failure: (error) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }

  @override
  void refresh() {
    _pageIndex = 1;
    getProjectList(false, refresh: true);
  }

  @override
  void initData(bool isShowLoading) {
    _pageIndex = 1;
    getProjectList(isShowLoading);
  }
}

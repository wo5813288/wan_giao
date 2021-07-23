
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/news_type_data.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/base/base_getx_controller_with_refresh.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
class NewsController extends BaseGetXControllerWithRefesh{

  var _newsTypes = <NewsType>[].obs;
  List<NewsType> get newsTypes => _newsTypes;

  var _tabController;
  ///获取新闻类型
  void getNewTypes(){
    handleRequest(HttpManager.instance.get("",newUrl: RequestApi.QUERY_NEWS_TYPE_API), true, (value){
      var newsTypeData = NewsTypeData.fromJson(value);
      _newsTypes.value = newsTypeData.data;
      loadState.value = _newsTypes.isEmpty ? LoadState.EMPTY : LoadState.SUCCESS;
    });
  }
}

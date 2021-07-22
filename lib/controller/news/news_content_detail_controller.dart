
import 'package:wan_android/bean/news_content_data.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/base/base_getx_controller.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:get/get.dart';

class NewsContentDetailController extends BaseGetXController{
  var _newsContent = NewsContent().obs;
  NewsContent get newsContent => _newsContent.value;

  void getNewsDetail(String newsId){
    handleRequest(HttpManager.instance.get("",newUrl: RequestApi.QUERY_NEWS_CONTENT_DETAIL(newsId)), true, (value){
      _newsContent.value =NewsContentData.fromJson(value).data;
      String content = _newsContent.value.content;
      _newsContent.value.images.forEach((img) {
        String imsg = img.position;
        content = content.replaceAll(imsg, "<img src=${img.imgSrc} />");
      });
      _newsContent.value.setContent(content);
      loadState.value = LoadState.SUCCESS;
    });
  }
}
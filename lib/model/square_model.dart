
import 'package:dio/dio.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/http/http_util.dart';
import 'package:wan_android/http/request_api.dart';

class SquareModel{

  static Future<ArticleResult> getSquareArticle(int page) async{
    var response;
    try{
      response =await HttpUtil.getInstance().get('${RequestApi.host}user_article/list/$page/json');
      print("首页文章==>${response.data}");
    }on DioError catch(e){
      throw HttpUtil.handleException(e);
    }
    return ArticleData.fromJson(response.data).data;
  }
}
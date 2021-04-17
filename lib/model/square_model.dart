
import 'package:dio/dio.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';

class SquareModel{

  static Future<ArticleResult> getSquareArticle(int page) async{
    var response =await HttpManager.instance.get('${RequestApi.host}user_article/list/$page/json');
    print("首页文章==>${response}");
    return ArticleData.fromJson(response).data;
  }
}
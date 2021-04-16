import 'package:dio/dio.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/bean/top_article_data.dart';
import 'package:wan_android/http/http_util.dart';
import 'package:wan_android/http/http_util2.dart';
import 'package:wan_android/http/request_api.dart';

class HomeModel {
  ///获取Banner数据
  static Future<List<BannerItem>> getHomeBanner() async {
    var response = await HttpUtil.getInstance().get(RequestApi.homeBanner);
    print(response.data);
    return BannerData.fromJson(response.data).data;
  }


  ///获取首页列表数据
  static Future<ArticleResult> getHomeArticle(int page) async {
    var response;
    try {
      response = await HttpUtil.getInstance()
          .get('article/list/$page/json');
      print("首页文章==>${response.data}");
    } on DioError catch (e) {
      throw HttpUtil.handleException(e);
    }
    return ArticleData.fromJson(response.data).data;
  }

  ///获取首页置顶文章
  static Future<List<ArticleItem>> getHomeTopArticle() async {
    var response;
    try {
      response = await HttpUtil.getInstance().get(RequestApi.homeTop);
      print("置顶文章==>${response.data}");
    } on DioError catch (e) {
      throw HttpUtil.handleException(e);
    }
    return TopArticleData.fromJson(response.data).data;
  }
}

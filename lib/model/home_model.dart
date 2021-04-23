import 'package:dio/dio.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/bean/top_article_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';

class HomeModel {
  ///获取Banner数据
  static Future<List<BannerItem>> getHomeBanner() async {
    var response = await HttpManager.instance.get(RequestApi.homeBanner);
    return BannerData.fromJson(response).data;
  }

  ///获取首页列表数据
  static Future<ArticleResult> getHomeArticle(int page) async {
    var response = await HttpManager.instance
        .get('article/list/$page/json');
    return ArticleData.fromJson(response).data;
  }

  ///获取首页置顶文章
  static Future<List<ArticleItem>> getHomeTopArticle() async {
    var response = await HttpManager.instance.get(RequestApi.homeTop);
    return TopArticleData.fromJson(response).data;
  }


}

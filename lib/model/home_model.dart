
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/http/dio.dart';
import 'package:wan_android/http/request_api.dart';

class HomeModel{
  ///获取Banner数据
  static Future<List<BannerItem>> getHomeBanner() async{
    var response =await XDio.getInstance().get(RequestApi.homeBadder);
    print(response.data);
    return BannerData.fromJson(response.data).data;
  }

  ///获取首页列表数据
  static Future<ArticleResult> getHomeArticle(int page) async{
    var response =await XDio.getInstance().get('https://www.wanandroid.com/article/list/$page/json');
    print("首页文章==>${response.data}");
    return ArticleData.fromJson(response.data).data;
  }

}
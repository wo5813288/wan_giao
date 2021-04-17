
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/top_article_data.dart';
import 'package:wan_android/bean/we_chat_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';

class WeChatModel{

  static Future<List<WeChat>> getWehChatData() async{
    var response = await HttpManager.instance.get(RequestApi.weChat);
    print("公众号==>${response}");
    return WeChatData.fromJson(response).data;
  }

  ///获取公众号文章
  static Future<ArticleResult> getArticleByAuthor(String authorId,int page) async {
    var response = await HttpManager.instance.get("wxarticle/list/$authorId/$page/json");
    print("作者文章==>${response}");
    return ArticleData.fromJson(response).data;
  }
}
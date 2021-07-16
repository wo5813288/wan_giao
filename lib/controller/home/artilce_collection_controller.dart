
import 'package:wan_android/controller/base/base_getx_controller.dart';
import 'package:wan_android/http/http_manager.dart';

class ArticleCollectionController extends BaseGetXController{

  ///收藏文章
  void collectionArticle(String id, success(), failure(String value)) {
    handleRequest(HttpManager.instance.post("lg/collect/$id/json"), false,
            (value) {
          success();
          update();
        }, failure: (error) {
          failure(error);
        });
  }

  ///取消收藏文章
  void unCollectionArticle(String id, success(), failure(String value)) {
    handleRequest(
        HttpManager.instance.post("lg/uncollect_originId/$id/json"), false,
            (value) {
          success();
          update();
        }, failure: (error) {
      failure(error);
    });
  }
}
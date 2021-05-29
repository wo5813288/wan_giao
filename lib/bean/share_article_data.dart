import 'package:wan_android/bean/article_item.dart';

/// errorMsg : ""
/// data : {"shareArticles":{"offset":0,"over":true,"datas":[],"pageCount":0,"size":20,"total":0,"curPage":1}}
/// errorCode : 0

class ShareArticleData {
  String errorMsg;
  ShareArticles data;
  int errorCode;

  ShareArticleData({this.errorMsg,this.data,this.errorCode});

  ShareArticleData.fromJson(dynamic json) {
    errorMsg = json["errorMsg"];
    data = json["data"] != null ? ShareArticles.fromJson(json["data"]["shareArticles"]) : null;
    errorCode = json["errorCode"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["errorMsg"] = errorMsg;
    if (data != null) {
      map["data"] = data.toJson();
    }
    map["errorCode"] = errorCode;
    return map;
  }

}


/// offset : 0
/// over : true
/// datas : []
/// pageCount : 0
/// size : 20
/// total : 0
/// curPage : 1

class ShareArticles {
  int _offset;
  bool _over;
  List<ArticleItem> _datas=[];
  int _pageCount;
  int _size;
  int _total;
  int _curPage;

  int get offset => _offset;
  bool get over => _over;
  List<ArticleItem> get datas => _datas;
  int get pageCount => _pageCount;
  int get size => _size;
  int get total => _total;
  int get curPage => _curPage;

  ShareArticles({
      int offset, 
      bool over, 
      List<ArticleItem> datas,
      int pageCount, 
      int size, 
      int total, 
      int curPage}){
    _offset = offset;
    _over = over;
    _datas = datas;
    _pageCount = pageCount;
    _size = size;
    _total = total;
    _curPage = curPage;
}

  ShareArticles.fromJson(dynamic json) {
    _offset = json["offset"];
    _over = json["over"];
    if (json["datas"] != null) {
      json["datas"].forEach((v) {
        _datas.add(ArticleItem.fromJson(v));
      });
    }
    _pageCount = json["pageCount"];
    _size = json["size"];
    _total = json["total"];
    _curPage = json["curPage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["offset"] = _offset;
    map["over"] = _over;
    if (_datas != null) {
      map["datas"] = _datas.map((v) => v.toJson()).toList();
    }
    map["pageCount"] = _pageCount;
    map["size"] = _size;
    map["total"] = _total;
    map["curPage"] = _curPage;
    return map;
  }

}
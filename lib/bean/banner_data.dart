/// data : [{"desc":"扔物线","id":29,"imagePath":"https://wanandroid.com/blogimgs/8a0131ac-05b7-4b6c-a8d0-f438678834ba.png","isVisible":1,"order":0,"title":"声明式 UI？Android 官方怒推的 Jetpack Compose 到底是什么？","type":0,"url":"http://i0k.cn/4WyJG"},{"desc":"","id":6,"imagePath":"https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png","isVisible":1,"order":1,"title":"我们新增了一个常用导航Tab~","type":1,"url":"https://www.wanandroid.com/navi"},{"desc":"一起来做个App吧","id":10,"imagePath":"https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png","isVisible":1,"order":1,"title":"一起来做个App吧","type":1,"url":"https://www.wanandroid.com/blog/show/2"},{"desc":"","id":20,"imagePath":"https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png","isVisible":1,"order":2,"title":"flutter 中文社区 ","type":1,"url":"https://flutter.cn/"}]
/// errorCode : 0
/// errorMsg : ""

class BannerData {
  List<BannerItem> _data;
  int _errorCode;
  String _errorMsg;

  List<BannerItem> get data => _data;
  int get errorCode => _errorCode;
  String get errorMsg => _errorMsg;

  BannerData({
      List<BannerItem> data,
      int errorCode, 
      String errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  BannerData.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(BannerItem.fromJson(v));
      });
    }
    _errorCode = json["errorCode"];
    _errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    map["errorCode"] = _errorCode;
    map["errorMsg"] = _errorMsg;
    return map;
  }

}

/// desc : "扔物线"
/// id : 29
/// imagePath : "https://wanandroid.com/blogimgs/8a0131ac-05b7-4b6c-a8d0-f438678834ba.png"
/// isVisible : 1
/// order : 0
/// title : "声明式 UI？Android 官方怒推的 Jetpack Compose 到底是什么？"
/// type : 0
/// url : "http://i0k.cn/4WyJG"

class BannerItem {
  String _desc;
  int _id;
  String _imagePath;
  int _isVisible;
  int _order;
  String _title;
  int _type;
  String _url;

  String get desc => _desc;
  int get id => _id;
  String get imagePath => _imagePath;
  int get isVisible => _isVisible;
  int get order => _order;
  String get title => _title;
  int get type => _type;
  String get url => _url;

  BannerItem({
      String desc, 
      int id, 
      String imagePath, 
      int isVisible, 
      int order, 
      String title, 
      int type, 
      String url}){
    _desc = desc;
    _id = id;
    _imagePath = imagePath;
    _isVisible = isVisible;
    _order = order;
    _title = title;
    _type = type;
    _url = url;
}

  BannerItem.fromJson(dynamic json) {
    _desc = json["desc"];
    _id = json["id"];
    _imagePath = json["imagePath"];
    _isVisible = json["isVisible"];
    _order = json["order"];
    _title = json["title"];
    _type = json["type"];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["desc"] = _desc;
    map["id"] = _id;
    map["imagePath"] = _imagePath;
    map["isVisible"] = _isVisible;
    map["order"] = _order;
    map["title"] = _title;
    map["type"] = _type;
    map["url"] = _url;
    return map;
  }

}
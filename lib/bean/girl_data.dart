/// code : 1
/// msg : "数据返回成功！"
/// data : {"page":1,"totalCount":999,"totalPage":100,"limit":10,"list":[{"imageUrl":"https://tvax3.sinaimg.cn/large/005BYqpgly1g1ut4tnhtwj31c00u0dks.jpg","imageSize":"1728x1080","imageFileLength":181578},null]}

class GirlData {
  int _code;
  String _msg;
  GirlResult _data;

  int get code => _code;
  String get msg => _msg;
  GirlResult get data => _data;

  GirlData({
      int code, 
      String msg,
    GirlResult data}){
    _code = code;
    _msg = msg;
    _data = data;
}

  GirlData.fromJson(dynamic json) {
    _code = json["code"];
    _msg = json["msg"];
    _data = json["data"] != null ? GirlResult.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["msg"] = _msg;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// page : 1
/// totalCount : 999
/// totalPage : 100
/// limit : 10
/// list : [{"imageUrl":"https://tvax3.sinaimg.cn/large/005BYqpgly1g1ut4tnhtwj31c00u0dks.jpg","imageSize":"1728x1080","imageFileLength":181578},null]

class GirlResult {
  int _page;
  int _totalCount;
  int _totalPage;
  int _limit;
  List<Girl> _list;

  int get page => _page;
  int get totalCount => _totalCount;
  int get totalPage => _totalPage;
  int get limit => _limit;
  List<Girl> get list => _list;

  GirlResult({
      int page, 
      int totalCount, 
      int totalPage, 
      int limit, 
      List<Girl> list}){
    _page = page;
    _totalCount = totalCount;
    _totalPage = totalPage;
    _limit = limit;
    _list = list;
}

  GirlResult.fromJson(dynamic json) {
    _page = json["page"];
    _totalCount = json["totalCount"];
    _totalPage = json["totalPage"];
    _limit = json["limit"];
    if (json["list"] != null) {
      _list = [];
      json["list"].forEach((v) {
        _list.add(Girl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = _page;
    map["totalCount"] = _totalCount;
    map["totalPage"] = _totalPage;
    map["limit"] = _limit;
    if (_list != null) {
      map["list"] = _list.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// imageUrl : "https://tvax3.sinaimg.cn/large/005BYqpgly1g1ut4tnhtwj31c00u0dks.jpg"
/// imageSize : "1728x1080"
/// imageFileLength : 181578

class Girl {
  String _imageUrl;
  String _imageSize;
  int _imageFileLength;

  String get imageUrl => _imageUrl;
  String get imageSize => _imageSize;
  int get imageFileLength => _imageFileLength;

  Girl({
      String imageUrl, 
      String imageSize, 
      int imageFileLength}){
    _imageUrl = imageUrl;
    _imageSize = imageSize;
    _imageFileLength = imageFileLength;
}

  Girl.fromJson(dynamic json) {
    _imageUrl = json["imageUrl"];
    _imageSize = json["imageSize"];
    _imageFileLength = json["imageFileLength"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["imageUrl"] = _imageUrl;
    map["imageSize"] = _imageSize;
    map["imageFileLength"] = _imageFileLength;
    return map;
  }

}
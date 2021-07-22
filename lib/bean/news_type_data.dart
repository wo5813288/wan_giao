/// code : 1
/// msg : "数据返回成功"
/// data : [{"typeId":509,"typeName":"财经"},{"typeId":510,"typeName":"科技"},null]

class NewsTypeData {
  int _code;
  String _msg;
  List<NewsType> _data;

  int get code => _code;
  String get msg => _msg;
  List<NewsType> get data => _data;

  NewsTypeData({
      int code,
      String msg,
      List<NewsType> data}){
    _code = code;
    _msg = msg;
    _data = data;
}

  NewsTypeData.fromJson(dynamic json) {
    _code = json["code"];
    _msg = json["msg"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(NewsType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["msg"] = _msg;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// typeId : 509
/// typeName : "财经"

class NewsType {
  int _typeId;
  String _typeName;

  int get typeId => _typeId;
  String get typeName => _typeName;

  NewsType({
      int typeId,
      String typeName}){
    _typeId = typeId;
    _typeName = typeName;
}

  NewsType.fromJson(dynamic json) {
    _typeId = json["typeId"];
    _typeName = json["typeName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["typeId"] = _typeId;
    map["typeName"] = _typeName;
    return map;
  }
}



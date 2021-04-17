/// data : [{"children":[],"courseId":13,"id":408,"name":"鸿洋","order":190000,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":409,"name":"郭霖","order":190001,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":410,"name":"玉刚说","order":190002,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":411,"name":"承香墨影","order":190003,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":413,"name":"Android群英传","order":190004,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":414,"name":"code小生","order":190005,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":415,"name":"谷歌开发者","order":190006,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":416,"name":"奇卓社","order":190007,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":417,"name":"美团技术团队","order":190008,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":420,"name":"GcsSloop","order":190009,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":421,"name":"互联网侦察","order":190010,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":427,"name":"susion随心","order":190011,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":428,"name":"程序亦非猿","order":190012,"parentChapterId":407,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":434,"name":"Gityuan","order":190013,"parentChapterId":407,"userControlSetTop":false,"visible":1}]
/// errorCode : 0
/// errorMsg : ""

class WeChatData {
  List<WeChat> _data;
  int _errorCode;
  String _errorMsg;

  List<WeChat> get data => _data;
  int get errorCode => _errorCode;
  String get errorMsg => _errorMsg;

  WeChatData({
      List<WeChat> data,
      int errorCode, 
      String errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  WeChatData.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(WeChat.fromJson(v));
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

/// children : []
/// courseId : 13
/// id : 408
/// name : "鸿洋"
/// order : 190000
/// parentChapterId : 407
/// userControlSetTop : false
/// visible : 1

class WeChat {
  List<String> _children;
  int _courseId;
  int _id;
  String _name;
  int _order;
  int _parentChapterId;
  bool _userControlSetTop;
  int _visible;

  List<dynamic> get children => _children;
  int get courseId => _courseId;
  int get id => _id;
  String get name => _name;
  int get order => _order;
  int get parentChapterId => _parentChapterId;
  bool get userControlSetTop => _userControlSetTop;
  int get visible => _visible;

  WeChat({
      List<String> children,
      int courseId, 
      int id, 
      String name, 
      int order, 
      int parentChapterId, 
      bool userControlSetTop, 
      int visible}){
    _children = children;
    _courseId = courseId;
    _id = id;
    _name = name;
    _order = order;
    _parentChapterId = parentChapterId;
    _userControlSetTop = userControlSetTop;
    _visible = visible;
}

  WeChat.fromJson(dynamic json) {
    if (json["children"] != null) {
      _children = [];
      json["children"].forEach((v) {
        _children.add(v);
      });
    }
    _courseId = json["courseId"];
    _id = json["id"];
    _name = json["name"];
    _order = json["order"];
    _parentChapterId = json["parentChapterId"];
    _userControlSetTop = json["userControlSetTop"];
    _visible = json["visible"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_children != null) {
      map["children"] = _children.map((v) => v).toList();
    }
    map["courseId"] = _courseId;
    map["id"] = _id;
    map["name"] = _name;
    map["order"] = _order;
    map["parentChapterId"] = _parentChapterId;
    map["userControlSetTop"] = _userControlSetTop;
    map["visible"] = _visible;
    return map;
  }

}
/// errorCode : 0
/// errorMsg : ""

class TipData {
  List<TipItem> _data;
  int _errorCode;
  String _errorMsg;

  List<TipItem> get data => _data;
  int get errorCode => _errorCode;
  String get errorMsg => _errorMsg;

  TipData({
      List<TipItem> data,
      int errorCode, 
      String errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  TipData.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(TipItem.fromJson(v));
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

/// children : [{"children":[],"courseId":13,"id":60,"name":"Android Studio相关","order":1000,"parentChapterId":150,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":169,"name":"gradle","order":1001,"parentChapterId":150,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":269,"name":"官方发布","order":1002,"parentChapterId":150,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":529,"name":"90-120hz","order":1003,"parentChapterId":150,"userControlSetTop":false,"visible":1}]
/// courseId : 13
/// id : 150
/// name : "开发环境"
/// order : 1
/// parentChapterId : 0
/// userControlSetTop : false
/// visible : 1

class TipItem {
  List<TipItemChildren> _children;
  int _courseId;
  int _id;
  String _name;
  int _order;
  int _parentChapterId;
  bool _userControlSetTop;
  int _visible;

  List<TipItemChildren> get children => _children;
  int get courseId => _courseId;
  int get id => _id;
  String get name => _name;
  int get order => _order;
  int get parentChapterId => _parentChapterId;
  bool get userControlSetTop => _userControlSetTop;
  int get visible => _visible;

  TipItem({
      List<TipItemChildren> children,
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

  TipItem.fromJson(dynamic json) {
    if (json["children"] != null) {
      _children = [];
      json["children"].forEach((v) {
        _children.add(TipItemChildren.fromJson(v));
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
      map["children"] = _children.map((v) => v.toJson()).toList();
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

/// children : []
/// courseId : 13
/// id : 60
/// name : "Android Studio相关"
/// order : 1000
/// parentChapterId : 150
/// userControlSetTop : false
/// visible : 1

class TipItemChildren {
  dynamic _children;
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

  TipItemChildren({
      List<dynamic> children, 
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

  TipItemChildren.fromJson(dynamic json) {
    _children = json["children"];
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
      map["children"] = _children.map((v) => v.toJson()).toList();
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
/// data : [{"id":6,"link":"","name":"面试","order":1,"visible":1},{"id":9,"link":"","name":"Studio3","order":1,"visible":1},{"id":5,"link":"","name":"动画","order":2,"visible":1},{"id":1,"link":"","name":"自定义View","order":3,"visible":1},{"id":2,"link":"","name":"性能优化 速度","order":4,"visible":1},{"id":3,"link":"","name":"gradle","order":5,"visible":1},{"id":4,"link":"","name":"Camera 相机","order":6,"visible":1},{"id":7,"link":"","name":"代码混淆 安全","order":7,"visible":1},{"id":8,"link":"","name":"逆向 加固","order":8,"visible":1}]
/// errorCode : 0
/// errorMsg : ""

class HotKeyData {
  List<HotKey> _data;
  int _errorCode;
  String _errorMsg;

  List<HotKey> get data => _data;
  int get errorCode => _errorCode;
  String get errorMsg => _errorMsg;

  HotKeyData({
      List<HotKey> data,
      int errorCode, 
      String errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  HotKeyData.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(HotKey.fromJson(v));
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

/// id : 6
/// link : ""
/// name : "面试"
/// order : 1
/// visible : 1

class HotKey {
  int _id;
  String _link;
  String _name;
  int _order;
  int _visible;

  int get id => _id;
  String get link => _link;
  String get name => _name;
  int get order => _order;
  int get visible => _visible;

  Data({
      int id, 
      String link, 
      String name, 
      int order, 
      int visible}){
    _id = id;
    _link = link;
    _name = name;
    _order = order;
    _visible = visible;
}

  HotKey.fromJson(dynamic json) {
    _id = json["id"];
    _link = json["link"];
    _name = json["name"];
    _order = json["order"];
    _visible = json["visible"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["link"] = _link;
    map["name"] = _name;
    map["order"] = _order;
    map["visible"] = _visible;
    return map;
  }

}
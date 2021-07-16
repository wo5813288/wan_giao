/// code : 1
/// msg : "数据返回成功"
/// data : [{"logisticsId":1,"logisticsName":"顺丰速运","hot":true},{"logisticsId":2,"logisticsName":"百世快递","hot":true},null]

class ExpressDeliveryData {
  int _code;
  String _msg;
  List<ExpressDelivery> _data;

  int get code => _code;
  String get msg => _msg;
  List<ExpressDelivery> get data => _data;

  ExpressDeliveryData({
      int code, 
      String msg, 
      List<ExpressDelivery> data}){
    _code = code;
    _msg = msg;
    _data = data;
}

  ExpressDeliveryData.fromJson(dynamic json) {
    _code = json["code"];
    _msg = json["msg"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(ExpressDelivery.fromJson(v));
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

/// logisticsId : 1
/// logisticsName : "顺丰速运"
/// hot : true

class ExpressDelivery {
  int _logisticsId;
  String _logisticsName;
  bool _hot;

  int get logisticsId => _logisticsId;
  String get logisticsName => _logisticsName;
  bool get hot => _hot;

  ExpressDelivery({
      int logisticsId, 
      String logisticsName, 
      bool hot}){
    _logisticsId = logisticsId;
    _logisticsName = logisticsName;
    _hot = hot;
}

  ExpressDelivery.fromJson(dynamic json) {
    _logisticsId = json["logisticsId"];
    _logisticsName = json["logisticsName"];
    _hot = json["hot"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["logisticsId"] = _logisticsId;
    map["logisticsName"] = _logisticsName;
    map["hot"] = _hot;
    return map;
  }

}
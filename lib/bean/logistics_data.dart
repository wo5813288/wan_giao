/// code : 1
/// msg : "数据返回成功"
/// data : {"logisticsNo":"804967979558203287","logisticsType":"圆通速递","status":"签收","data":[{"time":"2019-03-21 15:42:28","desc":"【河南省商丘市柘城公司】 已收件"},{"time":"2019-03-21 15:42:39","desc":"【河南省商丘市柘城】 已发出 下一站 【郑州转运中心】"},null]}

class LogisticsData {
  int _code;
  String _msg;
  Logistics _data;

  int get code => _code;
  String get msg => _msg;
  Logistics get data => _data;

  LogisticsData({
      int code, 
      String msg,
    Logistics data}){
    _code = code;
    _msg = msg;
    _data = data;
}

  LogisticsData.fromJson(dynamic json) {
    _code = json["code"];
    _msg = json["msg"];
    _data = json["data"] != null ? Logistics.fromJson(json["data"]) : null;
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

/// logisticsNo : "804967979558203287"
/// logisticsType : "圆通速递"
/// status : "签收"
/// data : [{"time":"2019-03-21 15:42:28","desc":"【河南省商丘市柘城公司】 已收件"},{"time":"2019-03-21 15:42:39","desc":"【河南省商丘市柘城】 已发出 下一站 【郑州转运中心】"},null]

class Logistics {
  String _logisticsNo;
  String _logisticsType;
  String _status;
  List<Trajectory> _data;

  String get logisticsNo => _logisticsNo;
  String get logisticsType => _logisticsType;
  String get status => _status;
  List<Trajectory> get data => _data;

  Logistics({
      String logisticsNo, 
      String logisticsType, 
      String status, 
      List<Trajectory> data}){
    _logisticsNo = logisticsNo;
    _logisticsType = logisticsType;
    _status = status;
    _data = data;
}

  Logistics.fromJson(dynamic json) {
    _logisticsNo = json["logisticsNo"];
    _logisticsType = json["logisticsType"];
    _status = json["status"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Trajectory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["logisticsNo"] = _logisticsNo;
    map["logisticsType"] = _logisticsType;
    map["status"] = _status;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// time : "2019-03-21 15:42:28"
/// desc : "【河南省商丘市柘城公司】 已收件"

class Trajectory {
  String _time;
  String _desc;

  String get time => _time;
  String get desc => _desc;

  Trajectory({
      String time, 
      String desc}){
    _time = time;
    _desc = desc;
}

  Trajectory.fromJson(dynamic json) {
    _time = json["time"];
    _desc = json["desc"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["time"] = _time;
    map["desc"] = _desc;
    return map;
  }

}
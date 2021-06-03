/// data : {"coinCount":451,"rank":7,"userId":2,"username":"x**oyang"}
/// errorCode : 0
/// errorMsg : ""

class CoinData {
  Coin _data;
  int _errorCode;
  String _errorMsg;

  Coin get data => _data;
  int get errorCode => _errorCode;
  String get errorMsg => _errorMsg;

  CoinData({
    Coin data,
      int errorCode, 
      String errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  CoinData.fromJson(dynamic json) {
    _data = json["data"] != null ? Coin.fromJson(json["data"]) : null;
    _errorCode = json["errorCode"];
    _errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    map["errorCode"] = _errorCode;
    map["errorMsg"] = _errorMsg;
    return map;
  }

}

/// coinCount : 451
/// rank : 7
/// userId : 2
/// username : "x**oyang"

class Coin {
  int _coinCount;
  String _rank;
  int _userId;
  String _username;
  int _level;
  int get coinCount => _coinCount;
  String get rank => _rank;
  int get userId => _userId;
  String get username => _username;
  int get level=>_level;
  Coin({
      int coinCount=0,
      String rank,
      int userId,
      int level=0,
      String username}){
    _coinCount = coinCount;
    _rank = rank;
    _userId = userId;
    _username = username;
    _level = level;
}

  Coin.fromJson(dynamic json) {
    _coinCount = json["coinCount"];
    _rank = json["rank"];
    _userId = json["userId"];
    _username = json["username"];
    _level = json["level"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["coinCount"] = _coinCount;
    map["rank"] = _rank;
    map["userId"] = _userId;
    map["username"] = _username;
    map["level"] = _level;
    return map;
  }

}
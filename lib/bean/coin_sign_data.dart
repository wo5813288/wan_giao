/// data : {"curPage":1,"datas":[{"coinCount":41,"date":1621749208000,"desc":"2021-05-23 13:53:28 签到 , 积分：15 + 26","id":435634,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":40,"date":1621594370000,"desc":"2021-05-21 18:52:50 签到 , 积分：15 + 25","id":435068,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":39,"date":1621476399000,"desc":"2021-05-20 10:06:39 签到 , 积分：15 + 24","id":433897,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":38,"date":1621396109000,"desc":"2021-05-19 11:48:29 签到 , 积分：15 + 23","id":433269,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":37,"date":1621304324000,"desc":"2021-05-18 10:18:44 签到 , 积分：15 + 22","id":432364,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":36,"date":1621223372000,"desc":"2021-05-17 11:49:32 签到 , 积分：15 + 21","id":431641,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":35,"date":1621057715000,"desc":"2021-05-15 13:48:35 签到 , 积分：15 + 20","id":430731,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":34,"date":1620713388000,"desc":"2021-05-11 14:09:48 签到 , 积分：15 + 19","id":427800,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":33,"date":1620198122000,"desc":"2021-05-05 15:02:02 签到 , 积分：15 + 18","id":424003,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":32,"date":1620032209000,"desc":"2021-05-03 16:56:49 签到 , 积分：15 + 17","id":423529,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":31,"date":1619862919000,"desc":"2021-05-01 17:55:19 签到 , 积分：15 + 16","id":423112,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":30,"date":1619421556000,"desc":"2021-04-26 15:19:16 签到 , 积分：15 + 15","id":419811,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":29,"date":1619193333000,"desc":"2021-04-23 23:55:33 签到 , 积分：15 + 14","id":418165,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":28,"date":1619055766000,"desc":"2021-04-22 09:42:46 签到 , 积分：15 + 13","id":416748,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":27,"date":1618654773000,"desc":"2021-04-17 18:19:33 签到 , 积分：15 + 12","id":413550,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":26,"date":1618390789000,"desc":"2021-04-14 16:59:49 签到 , 积分：15 + 11","id":411413,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":25,"date":1616862056000,"desc":"2021-03-28 00:20:56 签到 , 积分：15 + 10","id":400213,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":24,"date":1616851198000,"desc":"2021-03-27 21:19:58 签到 , 积分：15 + 9","id":400181,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":23,"date":1616470304000,"desc":"2021-03-23 11:31:44 签到 , 积分：15 + 8","id":397100,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":22,"date":1614300850000,"desc":"2021-02-26 08:54:10 签到 , 积分：15 + 7","id":380775,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"}],"offset":0,"over":false,"pageCount":9,"size":20,"total":177}
/// errorCode : 0
/// errorMsg : ""

class CoinSignData {
  CoinSignResult _data;
  int _errorCode;
  String _errorMsg;

  CoinSignResult get data => _data;
  int get errorCode => _errorCode;
  String get errorMsg => _errorMsg;

  CoinSignData({
    CoinSignResult data,
      int errorCode, 
      String errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  CoinSignData.fromJson(dynamic json) {
    _data = json["data"] != null ? CoinSignResult.fromJson(json["data"]) : null;
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

/// curPage : 1
/// datas : [{"coinCount":41,"date":1621749208000,"desc":"2021-05-23 13:53:28 签到 , 积分：15 + 26","id":435634,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":40,"date":1621594370000,"desc":"2021-05-21 18:52:50 签到 , 积分：15 + 25","id":435068,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":39,"date":1621476399000,"desc":"2021-05-20 10:06:39 签到 , 积分：15 + 24","id":433897,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":38,"date":1621396109000,"desc":"2021-05-19 11:48:29 签到 , 积分：15 + 23","id":433269,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":37,"date":1621304324000,"desc":"2021-05-18 10:18:44 签到 , 积分：15 + 22","id":432364,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":36,"date":1621223372000,"desc":"2021-05-17 11:49:32 签到 , 积分：15 + 21","id":431641,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":35,"date":1621057715000,"desc":"2021-05-15 13:48:35 签到 , 积分：15 + 20","id":430731,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":34,"date":1620713388000,"desc":"2021-05-11 14:09:48 签到 , 积分：15 + 19","id":427800,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":33,"date":1620198122000,"desc":"2021-05-05 15:02:02 签到 , 积分：15 + 18","id":424003,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":32,"date":1620032209000,"desc":"2021-05-03 16:56:49 签到 , 积分：15 + 17","id":423529,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":31,"date":1619862919000,"desc":"2021-05-01 17:55:19 签到 , 积分：15 + 16","id":423112,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":30,"date":1619421556000,"desc":"2021-04-26 15:19:16 签到 , 积分：15 + 15","id":419811,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":29,"date":1619193333000,"desc":"2021-04-23 23:55:33 签到 , 积分：15 + 14","id":418165,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":28,"date":1619055766000,"desc":"2021-04-22 09:42:46 签到 , 积分：15 + 13","id":416748,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":27,"date":1618654773000,"desc":"2021-04-17 18:19:33 签到 , 积分：15 + 12","id":413550,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":26,"date":1618390789000,"desc":"2021-04-14 16:59:49 签到 , 积分：15 + 11","id":411413,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":25,"date":1616862056000,"desc":"2021-03-28 00:20:56 签到 , 积分：15 + 10","id":400213,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":24,"date":1616851198000,"desc":"2021-03-27 21:19:58 签到 , 积分：15 + 9","id":400181,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":23,"date":1616470304000,"desc":"2021-03-23 11:31:44 签到 , 积分：15 + 8","id":397100,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"},{"coinCount":22,"date":1614300850000,"desc":"2021-02-26 08:54:10 签到 , 积分：15 + 7","id":380775,"reason":"签到","type":1,"userId":7780,"userName":"wo5813288"}]
/// offset : 0
/// over : false
/// pageCount : 9
/// size : 20
/// total : 177

class CoinSignResult {
  int _curPage;
  List<CoinSignItem> _datas;
  int _offset;
  bool _over;
  int _pageCount;
  int _size;
  int _total;

  int get curPage => _curPage;
  List<CoinSignItem> get datas => _datas;
  int get offset => _offset;
  bool get over => _over;
  int get pageCount => _pageCount;
  int get size => _size;
  int get total => _total;

  CoinSignResult({
      int curPage, 
      List<CoinSignItem> datas,
      int offset, 
      bool over, 
      int pageCount, 
      int size, 
      int total}){
    _curPage = curPage;
    _datas = datas;
    _offset = offset;
    _over = over;
    _pageCount = pageCount;
    _size = size;
    _total = total;
}

  CoinSignResult.fromJson(dynamic json) {
    _curPage = json["curPage"];
    if (json["datas"] != null) {
      _datas = [];
      json["datas"].forEach((v) {
        _datas.add(CoinSignItem.fromJson(v));
      });
    }
    _offset = json["offset"];
    _over = json["over"];
    _pageCount = json["pageCount"];
    _size = json["size"];
    _total = json["total"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["curPage"] = _curPage;
    if (_datas != null) {
      map["datas"] = _datas.map((v) => v.toJson()).toList();
    }
    map["offset"] = _offset;
    map["over"] = _over;
    map["pageCount"] = _pageCount;
    map["size"] = _size;
    map["total"] = _total;
    return map;
  }

}

/// coinCount : 41
/// date : 1621749208000
/// desc : "2021-05-23 13:53:28 签到 , 积分：15 + 26"
/// id : 435634
/// reason : "签到"
/// type : 1
/// userId : 7780
/// userName : "wo5813288"

class CoinSignItem {
  int _coinCount;
  int _date;
  String _desc;
  int _id;
  String _reason;
  int _type;
  int _userId;
  String _userName;

  int get coinCount => _coinCount;
  int get date => _date;
  String get desc => _desc;
  int get id => _id;
  String get reason => _reason;
  int get type => _type;
  int get userId => _userId;
  String get userName => _userName;

  CoinSignItem({
      int coinCount, 
      int date, 
      String desc, 
      int id, 
      String reason, 
      int type, 
      int userId, 
      String userName}){
    _coinCount = coinCount;
    _date = date;
    _desc = desc;
    _id = id;
    _reason = reason;
    _type = type;
    _userId = userId;
    _userName = userName;
}

  CoinSignItem.fromJson(dynamic json) {
    _coinCount = json["coinCount"];
    _date = json["date"];
    _desc = json["desc"];
    _id = json["id"];
    _reason = json["reason"];
    _type = json["type"];
    _userId = json["userId"];
    _userName = json["userName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["coinCount"] = _coinCount;
    map["date"] = _date;
    map["desc"] = _desc;
    map["id"] = _id;
    map["reason"] = _reason;
    map["type"] = _type;
    map["userId"] = _userId;
    map["userName"] = _userName;
    return map;
  }

}
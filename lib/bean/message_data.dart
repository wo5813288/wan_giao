class MessageData {
  MessageResult _data;
  int _errorCode;
  String _errorMsg;

  MessageResult get data => _data;

  int get errorCode => _errorCode;

  String get errorMsg => _errorMsg;

  MessageData({MessageResult data, int errorCode, String errorMsg}) {
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
  }

  MessageData.fromJson(dynamic json) {
    _data = json["data"] != null ? MessageResult.fromJson(json["data"]) : null;
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
/// {"category":1,"date":1626084925000,"fromUser":"18710249337","fromUserId":30573,"fullLink":"https://www.wanandroid.com/wenda/show/18281","id":182325,"isRead":1,"link":"/wenda/show/18281","message":"@Deprecated        public static final int TYPE_TOAST              = FIRST_SYSTEM_WINDOW+5;为什么系统弹出 Toast 不需要 android.permission.SYSTEM_ALERT_WINDOW 权限呢 ？","niceDate":"1天前","tag":"评论回复","title":"回复了@鸿洋","userId":7780},
/// offset : 0
/// over : false
/// pageCount : 2
/// size : 20
/// total : 33

class MessageResult {
  int _curPage;
  List<Message> _datas;
  int _offset;
  bool _over;
  int _pageCount;
  int _size;
  int _total;

  int get curPage => _curPage;

  List<Message> get datas => _datas;

  int get offset => _offset;

  bool get over => _over;

  int get pageCount => _pageCount;

  int get size => _size;

  int get total => _total;

  MessageResult(
      {int curPage,
      List<Message> datas,
      int offset,
      bool over,
      int pageCount,
      int size,
      int total}) {
    _curPage = curPage;
    _datas = datas;
    _offset = offset;
    _over = over;
    _pageCount = pageCount;
    _size = size;
    _total = total;
  }

  MessageResult.fromJson(dynamic json) {
    _curPage = json["curPage"];
    if (json["datas"] != null) {
      _datas = [];
      json["datas"].forEach((v) {
        _datas.add(Message.fromJson(v));
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

/// category : 1
/// date : 1626084925000
/// fromUser : "18710249337"
/// fromUserId : 30573
/// fullLink : "https://www.wanandroid.com/wenda/show/18281"
/// id : 182325
/// isRead : 1
/// link : "/wenda/show/18281"
/// message : "@Deprecated        public static final int TYPE_TOAST              = FIRST_SYSTEM_WINDOW+5;为什么系统弹出 Toast 不需要 android.permission.SYSTEM_ALERT_WINDOW 权限呢 ？"
/// niceDate : "1天前"
/// tag : "评论回复"
/// title : "回复了@鸿洋"
/// userId : 7780

class Message {
  int _category;
  int _date;
  String _fromUser;
  int _fromUserId;
  String _fullLink;
  int _id;
  int _isRead;
  String _link;
  String _message;
  String _niceDate;
  String _tag;
  String _title;
  int _userId;

  int get category => _category;

  int get date => _date;

  String get fromUser => _fromUser;

  int get fromUserId => _fromUserId;

  String get fullLink => _fullLink;

  int get id => _id;

  int get isRead => _isRead;

  String get link => _link;

  String get message => _message;

  String get niceDate => _niceDate;

  String get tag => _tag;

  String get title => _title;

  int get userId => _userId;

  Message(
      {int category,
      int date,
      String fromUser,
      int fromUserId,
      String fullLink,
      int id,
      int isRead,
      String link,
      String message,
      String niceDate,
      String tag,
      String title,
      int userId}) {
    _category = category;
    _date = date;
    _fromUser = fromUser;
    _fromUserId = fromUserId;
    _fullLink = fullLink;
    _id = id;
    _isRead = isRead;
    _link = link;
    _message = message;
    _niceDate = niceDate;
    _tag = tag;
    _title = title;
    _userId = userId;
  }

  Message.fromJson(dynamic json) {
    _category = json["category"];
    _date = json["date"];
    _fromUser = json["fromUser"];
    _fromUserId = json["fromUserId"];
    _fullLink = json["fullLink"];
    _id = json["id"];
    _isRead = json["isRead"];
    _link = json["link"];
    _message = json["message"];
    _niceDate = json["niceDate"];
    _tag = json["tag"];
    _title = json["title"];
    _userId = json["userId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["category"] = _category;
    map["date"] = _date;
    map["fromUser"] = _fromUser;
    map["fromUserId"] = _fromUserId;
    map["fullLink"] = _fullLink;
    map["id"] = _id;
    map["isRead"] = _isRead;
    map["link"] = _link;
    map["message"] = _message;
    map["niceDate"] = _niceDate;
    map["tag"] = _tag;
    map["title"] = _title;
    map["userId"] = _userId;
    return map;
  }
}

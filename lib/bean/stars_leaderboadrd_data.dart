import 'package:wan_android/bean/coin_data.dart';


class StarsLeaderboadrdData {
  StarsLeaderboadrdResult _data;
  int _errorCode;
  String _errorMsg;

  StarsLeaderboadrdResult get data => _data;
  int get errorCode => _errorCode;
  String get errorMsg => _errorMsg;

  StarsLeaderboadrdData({
    StarsLeaderboadrdResult data,
      int errorCode, 
      String errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  StarsLeaderboadrdData.fromJson(dynamic json) {
    _data = json["data"] != null ? StarsLeaderboadrdResult.fromJson(json["data"]) : null;
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
/// datas : [{"coinCount":41716,"level":418,"nickname":"","rank":"1","userId":20382,"username":"g**eii"},{"coinCount":39105,"level":392,"nickname":"","rank":"2","userId":29303,"username":"深**士"},{"coinCount":31025,"level":311,"nickname":"","rank":"3","userId":2,"username":"x**oyang"},{"coinCount":27528,"level":276,"nickname":"","rank":"4","userId":3559,"username":"A**ilEyon"},{"coinCount":21946,"level":220,"nickname":"","rank":"5","userId":29185,"username":"轻**宇"},{"coinCount":21561,"level":216,"nickname":"","rank":"6","userId":27,"username":"y**ochoo"},{"coinCount":21067,"level":211,"nickname":"","rank":"7","userId":3753,"username":"S**phenCurry"},{"coinCount":20911,"level":210,"nickname":"","rank":"8","userId":7809,"username":"1**23822235"},{"coinCount":20759,"level":208,"nickname":"","rank":"9","userId":14829,"username":"l**changwen"},{"coinCount":20727,"level":208,"nickname":"","rank":"10","userId":7891,"username":"h**zkp"},{"coinCount":20595,"level":206,"nickname":"","rank":"11","userId":4886,"username":"z**iyun"},{"coinCount":20547,"level":206,"nickname":"","rank":"12","userId":12351,"username":"w**igeny"},{"coinCount":20526,"level":206,"nickname":"","rank":"13","userId":26707,"username":"p**xc.com"},{"coinCount":20417,"level":205,"nickname":"","rank":"14","userId":7710,"username":"i**Cola7"},{"coinCount":20239,"level":203,"nickname":"","rank":"15","userId":7590,"username":"陈**啦啦啦"},{"coinCount":20218,"level":203,"nickname":"","rank":"16","userId":1534,"username":"j**gbin"},{"coinCount":19771,"level":198,"nickname":"","rank":"17","userId":833,"username":"w**lwaywang6"},{"coinCount":19770,"level":198,"nickname":"","rank":"18","userId":2068,"username":"i**Cola"},{"coinCount":19526,"level":196,"nickname":"","rank":"19","userId":28694,"username":"c**ng0218"},{"coinCount":19124,"level":192,"nickname":"","rank":"20","userId":25128,"username":"f**wandroid"},{"coinCount":19038,"level":191,"nickname":"","rank":"21","userId":3825,"username":"请**娃哈哈"},{"coinCount":18928,"level":190,"nickname":"","rank":"22","userId":25419,"username":"蔡**打篮球"},{"coinCount":18852,"level":189,"nickname":"","rank":"23","userId":29390,"username":"L**ing"},{"coinCount":18830,"level":189,"nickname":"","rank":"24","userId":28457,"username":"w**dla"},{"coinCount":18717,"level":188,"nickname":"","rank":"25","userId":2160,"username":"R**iner"},{"coinCount":18598,"level":186,"nickname":"","rank":"26","userId":12331,"username":"R**kieJay"},{"coinCount":17907,"level":180,"nickname":"","rank":"27","userId":25793,"username":"F**_2014"},{"coinCount":17655,"level":177,"nickname":"","rank":"28","userId":14839,"username":"x**y_sjc"},{"coinCount":16875,"level":169,"nickname":"","rank":"29","userId":29398,"username":"l**bwstory"},{"coinCount":16854,"level":169,"nickname":"","rank":"30","userId":2786,"username":"8**408834@qq.com"}]
/// offset : 0
/// over : false
/// pageCount : 2453
/// size : 30
/// total : 73583

class StarsLeaderboadrdResult {
  int _curPage;
  List<Coin> _datas;
  int _offset;
  bool _over;
  int _pageCount;
  int _size;
  int _total;

  int get curPage => _curPage;
  List<Coin> get datas => _datas;
  int get offset => _offset;
  bool get over => _over;
  int get pageCount => _pageCount;
  int get size => _size;
  int get total => _total;

  StarsLeaderboadrdResult({
      int curPage, 
      List<Coin> datas,
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

  StarsLeaderboadrdResult.fromJson(dynamic json) {
    _curPage = json["curPage"];
    if (json["datas"] != null) {
      _datas = [];
      json["datas"].forEach((v) {
        _datas.add(Coin.fromJson(v));
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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/route/routes_page.dart';

/// code : 1
/// msg : "数据返回成功"
/// data : [{"title":"习近平：巩固机构改革成果 推进治理体系和能力现代化","imgList":null,"source":"新华网","newsId":"EJBCPBMK000189FH","digest":"习近平在深化党和国家机构改革总结会议上强调巩固党和国家机构改革成果推进国家治理体系和治理能力现代化李克强栗战书汪洋赵乐际韩正出席王沪宁主持新华社北京7月5日电深","postTime":"2019-07-05 17:45:44","videoList":null},null]

class NewsItemData {
  int _code;
  String _msg;
  List<NewsItem> _data;

  int get code => _code;

  String get msg => _msg;

  List<NewsItem> get data => _data;

  NewsItemData({int code, String msg, List<NewsItem> data}) {
    _code = code;
    _msg = msg;
    _data = data;
  }

  NewsItemData.fromJson(dynamic json) {
    _code = json["code"];
    _msg = json["msg"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(NewsItem.fromJson(v));
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

/// title : "习近平：巩固机构改革成果 推进治理体系和能力现代化"
/// imgList : null
/// source : "新华网"
/// newsId : "EJBCPBMK000189FH"
/// digest : "习近平在深化党和国家机构改革总结会议上强调巩固党和国家机构改革成果推进国家治理体系和治理能力现代化李克强栗战书汪洋赵乐际韩正出席王沪宁主持新华社北京7月5日电深"
/// postTime : "2019-07-05 17:45:44"
/// videoList : null

class NewsItem {
  String _title;
  List<String> _imgList;
  String _source;
  String _newsId;
  String _digest;
  String _postTime;
  dynamic _videoList;

  String get title => _title;

  List<String> get imgList => _imgList;

  String get source => _source;

  String get newsId => _newsId;

  String get digest => _digest;

  String get postTime => _postTime;

  dynamic get videoList => _videoList;

  NewsItem(
      {String title,
      List<String> imgList,
      String source,
      String newsId,
      String digest,
      String postTime,
      dynamic videoList}) {
    _title = title;
    _imgList = imgList;
    _source = source;
    _newsId = newsId;
    _digest = digest;
    _postTime = postTime;
    _videoList = videoList;
  }

  NewsItem.fromJson(dynamic json) {
    _title = json["title"];
    _imgList = [];
    if (json["imgList"] != null) {
      json["imgList"].forEach((v) {
        _imgList.add(v);
      });
    }
    _source = json["source"];
    _newsId = json["newsId"];
    _digest = json["digest"];
    _postTime = json["postTime"];
    _videoList = json["videoList"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    if (_imgList != null) {
      map["imgList"] = _imgList.map((v) => v).toList();
    }
    map["source"] = _source;
    map["newsId"] = _newsId;
    map["digest"] = _digest;
    map["postTime"] = _postTime;
    map["videoList"] = _videoList;
    return map;
  }
}

class NewsListItemUI extends StatelessWidget {
  final NewsItem newsContent;

  NewsListItemUI(this.newsContent);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RoutesConfig.NEWS_CONTENT_PAGE,
            arguments: newsContent.toJson());
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ///第一行 作者
                  Text(
                    newsContent.source,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  //第一行 右侧 时间
                  Expanded(
                    child: Text(
                      newsContent.postTime,
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              //中间的标题
              Text(newsContent.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 17,
                      color:
                          Theme.of(context).textTheme.headline1.color,
                      fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                newsContent.digest ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).textTheme.bodyText1.color),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              CachedNetworkImage(
                imageUrl: newsContent.imgList.isNotEmpty?newsContent.imgList[0]:'https://www.wanandroid.com/resources/image/pc/default_project_img.jpg',
                placeholder: (context,str){
                  return Image.asset("assets/images/default_project_img.png",fit: BoxFit.cover);
                },
                fit: BoxFit.cover,
                width: ScreenUtil().screenWidth,
                height: 150.h,
              ),
            ],
          )),
    );
  }
}

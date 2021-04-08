import 'package:wan_android/bean/article_item.dart';

/// data : [{"apkLink":"","audit":1,"author":"扔物线","canEdit":false,"chapterId":249,"chapterName":"干货资源","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":12554,"link":"http://i0k.cn/5axC1","niceDate":"刚刚","niceShareDate":"2020-03-23 16:36","origin":"","prefix":"","projectLink":"","publishTime":1617206400000,"realSuperChapterId":248,"selfVisible":0,"shareDate":1584952597000,"shareUser":"","superChapterId":249,"superChapterName":"干货资源","tags":[],"title":"声明式 UI？Android 官方怒推的 Jetpack Compose 到底是什么？","type":1,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"Android技术最前线","canEdit":false,"chapterId":249,"chapterName":"干货资源","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":17189,"link":"https://mp.weixin.qq.com/s/U-0GK6cXEfpyRkcONlR6TA","niceDate":"5小时前","niceShareDate":"2021-02-04 16:36","origin":"","prefix":"","projectLink":"","publishTime":1616996542000,"realSuperChapterId":248,"selfVisible":0,"shareDate":1612427811000,"shareUser":"","superChapterId":249,"superChapterName":"干货资源","tags":[],"title":"【10w字笔记+75集视频】保姆式教程助你熟练掌握Android必会的开源框架","type":1,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>记得mipmap刚出来的时候，出现过很多言论，XXX类型图片放mipmap更好。</p>\r\n<p>如今的观念基本停留在，仅将app icon放置到mipmap，其他的图片都放到drawable。</p>\r\n<p>那么我们想想：</p>\r\n<ol>\r\n<li>google 为啥要搞个mipmap，或者mipmap有什么特殊的能力？</li>\r\n<li>从源码上能做出相关分析吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17666,"link":"https://wanandroid.com/wenda/show/17666","niceDate":"2021-03-18 23:19","niceShareDate":"2021-03-17 21:12","origin":"","prefix":"","projectLink":"","publishTime":1616080780000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1615986729000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | mipmap vs drawable，傻傻分不清楚？","type":1,"userId":2,"visible":1,"zan":2},{"apkLink":"","audit":1,"author":"鸿洋","canEdit":false,"chapterId":360,"chapterName":"小编发布","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17675,"link":"https://wanandroid.com/blog/show/2964","niceDate":"2021-03-18 13:26","niceShareDate":"2021-03-18 13:26","origin":"","prefix":"","projectLink":"","publishTime":1616045214000,"realSuperChapterId":297,"selfVisible":0,"shareDate":1616045193000,"shareUser":"","superChapterId":298,"superChapterName":"原创文章","tags":[{"name":"本站发布","url":"/article/list/0?cid=360"}],"title":"公告：wanandroid api 对于毕设的回复","type":1,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>很多时候我们在自定义 View 的需要做动画的时候，我们可以依赖属性动画的回调周期性修改 自定义的属性值，然后调用 invalidate 方法实现。</p>\r\n<p>不过我还见过一个比较野的路子，它在 onDraw 里面直接修改属性，然后调用 invalidate() 方法。</p>\r\n<p>运行起来好像也没问题。</p>\r\n<p>那么问题来了：</p>\r\n<ol>\r\n<li>在 onDraw 里面调用 修改绘制相关属性（例如画圆，修改半径） invalidate() ，这种与属性动画的回调调用 invalidate()源码分析有什么区别？</li>\r\n<li>在 onDraw 里面调用  invalidate() 会存在什么问题？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17629,"link":"https://www.wanandroid.com/wenda/show/17629","niceDate":"2021-03-15 00:43","niceShareDate":"2021-03-15 00:43","origin":"","prefix":"","projectLink":"","publishTime":1615740221000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1615740191000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | onDraw 里面调用 invalidate 做动画，有什么问题？","type":1,"userId":2,"visible":1,"zan":6}]
/// errorCode : 0
/// errorMsg : ""

class TopArticleData {
  List<ArticleItem> _data;
  int _errorCode;
  String _errorMsg;

  List<ArticleItem> get data => _data;

  int get errorCode => _errorCode;

  String get errorMsg => _errorMsg;

  TopArticleData({List<ArticleItem> data, int errorCode, String errorMsg}) {
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
  }

  TopArticleData.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(ArticleItem.fromJson(v));
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


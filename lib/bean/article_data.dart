import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/controller/artilce_collection_controller.dart';
import 'package:wan_android/route/routes_page.dart';

/// data : {"curPage":1,"datas":[{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17759,"link":"https://blog.csdn.net/willway_wang/article/details/104592006?spm=1001.2014.3001.5501","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616723465000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616723465000,"shareUser":"willwaywang6","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"Java筑基&mdash;&mdash;多线程（状态、安全以及通信）","type":0,"userId":833,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17757,"link":"https://juejin.cn/post/6844904016283975687","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616721649000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616721649000,"shareUser":"躬行之","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"手把手教你实现实现一个Android日期选择器","type":0,"userId":23270,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17756,"link":"https://www.jianshu.com/p/dc58a0bc3fd9","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616721583000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616721544000,"shareUser":"hp1451193026","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"06 Android动画-详解","type":0,"userId":2058,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":228,"chapterName":"辅助 or 工具类","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17754,"link":"https://juejin.cn/post/6943062517467840520","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616687072000,"realSuperChapterId":156,"selfVisible":0,"shareDate":1616686961000,"shareUser":"鸿洋","superChapterId":135,"superChapterName":"项目必备","tags":[],"title":"Android 屏幕适配，那些你必须掌握的稀碎知识点","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":142,"chapterName":"ConstraintLayout","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17755,"link":"https://juejin.cn/post/6943530210222571528","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616687053000,"realSuperChapterId":39,"selfVisible":0,"shareDate":1616687006000,"shareUser":"鸿洋","superChapterId":55,"superChapterName":"5.+高新技术","tags":[],"title":"MotionLayout 真有点儿东西!","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17752,"link":"https://juejin.cn/post/6943206672898719780","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616679567000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616679567000,"shareUser":"roger11","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"ARouter疑难杂症解析","type":0,"userId":65727,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17748,"link":"https://juejin.cn/post/6943048240291905549","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616642183000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616642183000,"shareUser":"jimu","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"温故而知新 | 打破Handler问到底","type":0,"userId":72158,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17747,"link":"https://juejin.cn/post/6941996743974191111","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616636034000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616636034000,"shareUser":"jingbin","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"RecyclerView嵌套滑动置顶 项目应用篇","type":0,"userId":1534,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17746,"link":"https://blog.csdn.net/z979451341/article/details/115175946","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616634650000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616634650000,"shareUser":"https://jianpanwuzhe.blog.csdn.net/","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"CountDownTimer源码解析","type":0,"userId":14717,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":55,"chapterName":"新的API","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17742,"link":"https://juejin.cn/post/6943037393893064734","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616602571000,"realSuperChapterId":39,"selfVisible":0,"shareDate":1616602305000,"shareUser":"鸿洋","superChapterId":55,"superChapterName":"5.+高新技术","tags":[],"title":"线程切换哪家强？RxJava与Flow的操作符对比","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":313,"chapterName":"字节码","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17744,"link":"https://www.jianshu.com/p/fba2eec47976","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616602557000,"realSuperChapterId":244,"selfVisible":0,"shareDate":1616602516000,"shareUser":"鸿洋","superChapterId":245,"superChapterName":"Java深入","tags":[],"title":"JavaPoet - 优雅地生成代码","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":98,"chapterName":"WebView","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17743,"link":"https://www.jianshu.com/p/48693ecd5d70","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616602544000,"realSuperChapterId":34,"selfVisible":0,"shareDate":1616602414000,"shareUser":"鸿洋","superChapterId":98,"superChapterName":"网络访问","tags":[],"title":"有效解决WebView多进程崩溃","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"鸿洋","canEdit":false,"chapterId":408,"chapterName":"鸿洋","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17753,"link":"https://mp.weixin.qq.com/s/y2Qx9vwSpJIVItWLgxU1qg","niceDate":"2天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616601600000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1616681029000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/408/1"}],"title":"Android IPC 之 Binder搞不清楚可不行！","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17734,"link":"https://juejin.cn/post/6942859907586588685","niceDate":"2021-03-24 10:45","niceShareDate":"2021-03-24 10:45","origin":"","prefix":"","projectLink":"","publishTime":1616553909000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616553909000,"shareUser":"逮虾户","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"还在用build.gradle吗？试试build.gradle.kts吧","type":0,"userId":63284,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"张鸿洋","canEdit":false,"chapterId":543,"chapterName":"Android技术周报","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17730,"link":"/blog/show/2969","niceDate":"2021-03-24 00:00","niceShareDate":"2021-03-24 00:10","origin":"","prefix":"","projectLink":"","publishTime":1616515200000,"realSuperChapterId":542,"selfVisible":0,"shareDate":1616515800000,"shareUser":"","superChapterId":543,"superChapterName":"技术周报","tags":[],"title":"Android 技术周刊 （2021-03-17 ~ 2021-03-24）","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"鸿洋","canEdit":false,"chapterId":408,"chapterName":"鸿洋","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17740,"link":"https://mp.weixin.qq.com/s/t1VBFZSOrzfxjxbfELF2Ng","niceDate":"2021-03-24 00:00","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616515200000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1616598285000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/408/1"}],"title":"Android 架构探索，MVVM 原来如此简单！","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"郭霖","canEdit":false,"chapterId":409,"chapterName":"郭霖","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17741,"link":"https://mp.weixin.qq.com/s/DNiaQEcE7LOhhxfLu7gycg","niceDate":"2021-03-24 00:00","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616515200000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1616598299000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/409/1"}],"title":"Android轻量级存储方案的前世今生","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":98,"chapterName":"WebView","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17721,"link":"https://juejin.cn/post/6942404092819931166","niceDate":"2021-03-23 23:45","niceShareDate":"2021-03-23 11:23","origin":"","prefix":"","projectLink":"","publishTime":1616514340000,"realSuperChapterId":34,"selfVisible":0,"shareDate":1616469811000,"shareUser":"程序员徐公","superChapterId":98,"superChapterName":"网络访问","tags":[],"title":"Android webView 的一个坑，字体怎么突然变小了","type":0,"userId":5339,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":76,"chapterName":"项目架构","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17724,"link":"https://juejin.cn/post/6942464122273398820","niceDate":"2021-03-23 23:45","niceShareDate":"2021-03-23 16:12","origin":"","prefix":"","projectLink":"","publishTime":1616514327000,"realSuperChapterId":53,"selfVisible":0,"shareDate":1616487136000,"shareUser":"18616720137","superChapterId":76,"superChapterName":"热门专题","tags":[],"title":"关于Android 架构，你是否还在生搬硬套？","type":0,"userId":36628,"visible":1,"zan":0}],"offset":0,"over":false,"pageCount":513,"size":20,"total":10245}
/// errorCode : 0
/// errorMsg : ""

class ArticleData {
  ArticleResult _data;
  int _errorCode;
  String _errorMsg;

  ArticleResult get data => _data;

  int get errorCode => _errorCode;

  String get errorMsg => _errorMsg;

  ArticleData({ArticleResult data, int errorCode, String errorMsg}) {
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
  }

  ArticleData.fromJson(dynamic json) {
    _data = json["data"] != null ? ArticleResult.fromJson(json["data"]) : null;
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
/// datas : [{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17759,"link":"https://blog.csdn.net/willway_wang/article/details/104592006?spm=1001.2014.3001.5501","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616723465000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616723465000,"shareUser":"willwaywang6","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"Java筑基&mdash;&mdash;多线程（状态、安全以及通信）","type":0,"userId":833,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17757,"link":"https://juejin.cn/post/6844904016283975687","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616721649000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616721649000,"shareUser":"躬行之","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"手把手教你实现实现一个Android日期选择器","type":0,"userId":23270,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17756,"link":"https://www.jianshu.com/p/dc58a0bc3fd9","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616721583000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616721544000,"shareUser":"hp1451193026","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"06 Android动画-详解","type":0,"userId":2058,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":228,"chapterName":"辅助 or 工具类","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17754,"link":"https://juejin.cn/post/6943062517467840520","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616687072000,"realSuperChapterId":156,"selfVisible":0,"shareDate":1616686961000,"shareUser":"鸿洋","superChapterId":135,"superChapterName":"项目必备","tags":[],"title":"Android 屏幕适配，那些你必须掌握的稀碎知识点","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":142,"chapterName":"ConstraintLayout","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17755,"link":"https://juejin.cn/post/6943530210222571528","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616687053000,"realSuperChapterId":39,"selfVisible":0,"shareDate":1616687006000,"shareUser":"鸿洋","superChapterId":55,"superChapterName":"5.+高新技术","tags":[],"title":"MotionLayout 真有点儿东西!","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17752,"link":"https://juejin.cn/post/6943206672898719780","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616679567000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616679567000,"shareUser":"roger11","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"ARouter疑难杂症解析","type":0,"userId":65727,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17748,"link":"https://juejin.cn/post/6943048240291905549","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616642183000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616642183000,"shareUser":"jimu","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"温故而知新 | 打破Handler问到底","type":0,"userId":72158,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17747,"link":"https://juejin.cn/post/6941996743974191111","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616636034000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616636034000,"shareUser":"jingbin","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"RecyclerView嵌套滑动置顶 项目应用篇","type":0,"userId":1534,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17746,"link":"https://blog.csdn.net/z979451341/article/details/115175946","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616634650000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616634650000,"shareUser":"https://jianpanwuzhe.blog.csdn.net/","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"CountDownTimer源码解析","type":0,"userId":14717,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":55,"chapterName":"新的API","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17742,"link":"https://juejin.cn/post/6943037393893064734","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616602571000,"realSuperChapterId":39,"selfVisible":0,"shareDate":1616602305000,"shareUser":"鸿洋","superChapterId":55,"superChapterName":"5.+高新技术","tags":[],"title":"线程切换哪家强？RxJava与Flow的操作符对比","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":313,"chapterName":"字节码","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17744,"link":"https://www.jianshu.com/p/fba2eec47976","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616602557000,"realSuperChapterId":244,"selfVisible":0,"shareDate":1616602516000,"shareUser":"鸿洋","superChapterId":245,"superChapterName":"Java深入","tags":[],"title":"JavaPoet - 优雅地生成代码","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":98,"chapterName":"WebView","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17743,"link":"https://www.jianshu.com/p/48693ecd5d70","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616602544000,"realSuperChapterId":34,"selfVisible":0,"shareDate":1616602414000,"shareUser":"鸿洋","superChapterId":98,"superChapterName":"网络访问","tags":[],"title":"有效解决WebView多进程崩溃","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"鸿洋","canEdit":false,"chapterId":408,"chapterName":"鸿洋","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17753,"link":"https://mp.weixin.qq.com/s/y2Qx9vwSpJIVItWLgxU1qg","niceDate":"2天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1616601600000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1616681029000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/408/1"}],"title":"Android IPC 之 Binder搞不清楚可不行！","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17734,"link":"https://juejin.cn/post/6942859907586588685","niceDate":"2021-03-24 10:45","niceShareDate":"2021-03-24 10:45","origin":"","prefix":"","projectLink":"","publishTime":1616553909000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1616553909000,"shareUser":"逮虾户","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"还在用build.gradle吗？试试build.gradle.kts吧","type":0,"userId":63284,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"张鸿洋","canEdit":false,"chapterId":543,"chapterName":"Android技术周报","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17730,"link":"/blog/show/2969","niceDate":"2021-03-24 00:00","niceShareDate":"2021-03-24 00:10","origin":"","prefix":"","projectLink":"","publishTime":1616515200000,"realSuperChapterId":542,"selfVisible":0,"shareDate":1616515800000,"shareUser":"","superChapterId":543,"superChapterName":"技术周报","tags":[],"title":"Android 技术周刊 （2021-03-17 ~ 2021-03-24）","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"鸿洋","canEdit":false,"chapterId":408,"chapterName":"鸿洋","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17740,"link":"https://mp.weixin.qq.com/s/t1VBFZSOrzfxjxbfELF2Ng","niceDate":"2021-03-24 00:00","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616515200000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1616598285000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/408/1"}],"title":"Android 架构探索，MVVM 原来如此简单！","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"郭霖","canEdit":false,"chapterId":409,"chapterName":"郭霖","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17741,"link":"https://mp.weixin.qq.com/s/DNiaQEcE7LOhhxfLu7gycg","niceDate":"2021-03-24 00:00","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1616515200000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1616598299000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/409/1"}],"title":"Android轻量级存储方案的前世今生","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":98,"chapterName":"WebView","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17721,"link":"https://juejin.cn/post/6942404092819931166","niceDate":"2021-03-23 23:45","niceShareDate":"2021-03-23 11:23","origin":"","prefix":"","projectLink":"","publishTime":1616514340000,"realSuperChapterId":34,"selfVisible":0,"shareDate":1616469811000,"shareUser":"程序员徐公","superChapterId":98,"superChapterName":"网络访问","tags":[],"title":"Android webView 的一个坑，字体怎么突然变小了","type":0,"userId":5339,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":76,"chapterName":"项目架构","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":17724,"link":"https://juejin.cn/post/6942464122273398820","niceDate":"2021-03-23 23:45","niceShareDate":"2021-03-23 16:12","origin":"","prefix":"","projectLink":"","publishTime":1616514327000,"realSuperChapterId":53,"selfVisible":0,"shareDate":1616487136000,"shareUser":"18616720137","superChapterId":76,"superChapterName":"热门专题","tags":[],"title":"关于Android 架构，你是否还在生搬硬套？","type":0,"userId":36628,"visible":1,"zan":0}]
/// offset : 0
/// over : false
/// pageCount : 513
/// size : 20
/// total : 10245

class ArticleResult {
  int _curPage;
  List<ArticleItem> _datas;
  int _offset;
  bool _over;
  int _pageCount;
  int _size;
  int _total;

  int get curPage => _curPage;

  List<ArticleItem> get datas => _datas;

  int get offset => _offset;

  bool get over => _over;

  int get pageCount => _pageCount;

  int get size => _size;

  int get total => _total;

  ArticleResult(
      {int curPage,
      List<ArticleItem> datas,
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

  ArticleResult.fromJson(dynamic json) {
    _curPage = json["curPage"];
    if (json["datas"] != null) {
      _datas = [];
      json["datas"].forEach((v) {
        _datas.add(ArticleItem.fromJson(v));
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

class HomeListItemUI extends StatefulWidget {
  final ArticleItem articleItem;
  final GestureTapCallback onTap;
  final bool isTop;

  HomeListItemUI({@required this.articleItem, this.onTap, this.isTop = false});

  @override
  _HomeListItemUIState createState() => _HomeListItemUIState();
}

class _HomeListItemUIState extends State<HomeListItemUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15, right: 10, bottom: 5),
        child: InkWell(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    padding: EdgeInsets.all(3.0),
                    icon:widget.articleItem.collect ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border),
                    onPressed: () {
                      //点击收藏按钮
                      !widget.articleItem.collect? Get.find<ArticleCollectionController>().collectionArticle(
                          widget.articleItem.id.toString(), () {
                        widget.articleItem.setCollection(true);
                        showToast("收藏成功");
                        setState(() {

                        });
                      }, (value) {
                        showToast(value);
                      }) : Get.find<ArticleCollectionController>().unCollectionArticle(
                          widget.articleItem.id.toString(), () {
                        //取消收藏
                        widget.articleItem.setCollection(false);
                        setState(() {

                        });
                      }, (value) {
                        showToast(value);
                      });
                    }),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Visibility(
                            //显示“置顶”字样
                              visible: widget.isTop,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.red, width: 1)),
                                child: Text(
                                  "置顶",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.red),
                                ),
                              )),

                          ///第一行 作者
                          Text(
                            widget.articleItem.shareUser.isEmpty
                                ? widget.articleItem.author
                                : widget.articleItem.shareUser,
                            style:
                            TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          //第一行 右侧 时间
                          Expanded(
                            child: Text(
                              widget.articleItem.niceDate,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      //中间的标题
                      Text(widget.articleItem.title,
                          style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).textTheme.headline1.color,
                              fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      //底部的文章类型
                      Text(
                        "${widget.articleItem.superChapterName}/${widget.articleItem.chapterName}",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
            onTap: widget.onTap??(){
              Get.toNamed(
                  RoutesConfig.WEB_PAGE,
                  arguments: {
                    ConstantInfo.ARTICLE_TITLE:widget.articleItem.title,
                    ConstantInfo.ARTICLE_URL:widget.articleItem.link,
                    ConstantInfo.ARTICLE_AUTHOR:widget.articleItem.shareUser.isEmpty?widget.articleItem.author:widget.articleItem.shareUser,
                  });
            }));
  }
}

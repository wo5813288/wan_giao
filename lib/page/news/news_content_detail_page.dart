


import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/news/news_content_detail_controller.dart';
import 'package:html/parser.dart' as htmlParser;

class NewsContentDetailPage extends GetView<NewsContentDetailController> {
  const NewsContentDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: GetX<NewsContentDetailController>(
        initState: (_){
          controller.getNewsDetail(Get.arguments['newsId']);
        },
        builder: (_){
          return StateCommonPage<NewsContentDetailController>(
            model: controller,
            onPressed: (){
              controller.getNewsDetail(Get.arguments['newsId']);
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //标题
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        controller.newsContent.title,
                        style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold),
                      )
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.only(right: 10.w),
                    width: ScreenUtil().screenWidth,
                    alignment: Alignment.centerRight,
                    child: Text(controller.newsContent.ptime,style: TextStyle(color: Colors.grey)),
                  ),
                  //内容
                  Html(
                    data:controller.newsContent.content,
                    style: {
                      "p":Style(color: Colors.black,fontSize:FontSize.large)
                    },
                    onImageTap: (src,_,__,___){
                      showToast(src);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  ///构建顶部bar
  Widget _buildAppBar(){
    return AppBar(
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: Colors.white,
      title:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //作者头像
          SizedBox(
              width: ScreenUtil().setWidth(25),
              height: ScreenUtil().setWidth(25),
              child:Image.asset("assets/icon/ic_autor_avatar.png")
          ),
          SizedBox(width: 10.w),
          //作者名
          Text(
            Get.arguments['source'],
            style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black
            ),
          )
        ],

      ),
      actions: [
        IconButton(icon: Icon(Icons.ios_share), onPressed: (){

        }),
        PopupMenuButton<int>(
          icon: Icon(Icons.more_vert),
          onSelected: (value) {
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 0,
                child: Text("刷新"),
              ),
              PopupMenuItem(
                value: 1,
                child: Text("复制链接"),
              ),
              PopupMenuItem(
                child: Text("分享链接"),
                value: 2,
              ),
            ];
          },
        )
      ],
    );
  }
}

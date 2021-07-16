import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/compents/icon_text_widget.dart';
import 'package:wan_android/controller/person/user_info_controller.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/http/request_api.dart';
import 'package:wan_android/route/routes_page.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> with AutomaticKeepAliveClientMixin{
  double mainAixSpacing = 5.w;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          _buildTitleUI(),
          _buildTopUIPage(),
          _commonUIPage(),
        ],
      ),
    );
  }

  Widget _buildTitleUI() {
    //顶部标题栏
    return SliverAppBar(
      brightness: Brightness.dark,
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Get.toNamed(RoutesConfig.SETTING_PAGE);
          },
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              CachedNetworkImage(
                cacheKey: Random().nextInt(100).toString(),
                imageUrl: RequestApi.PERSON_PAGE_TOP_BACKGROUND_API,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                placeholder: (context,url){
                  return Image.asset(
                      "assets/icon/ic_default_avatar.png",
                      fit: BoxFit.cover,
                      width: double.infinity);
                },
              ),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: _buildPersonTop())
            ],
          )
      ),
      expandedHeight: 200.h,
    );
  }

  ///创建个人头像信息
  Widget _buildPersonTop() {
    return Container(
      height: 80.h,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //头像
          Container(
            width: 70.w,
            height: 70.w,
            //加一个头像的边框
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border:
                    Border.all(width: 2.5, color: Colors.grey.withOpacity(0.5)),
                color: Colors.grey[200].withOpacity(0.5)),
            child:Obx((){
              return CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:Get.find<AppState>().loginState.value==LoginState.LOGIN?
                  NetworkImage(RequestApi.PERSON_PAGE_AVATAR)
                      :AssetImage("assets/icon/ic_default_avatar.png")
              );
            })
          ),
          SizedBox(width: 10.w),
          //个人信息
          _personInfoText(),
          //二维码
          _personQRcode()
        ],
      ),
    );
  }

  ///个人信息详情Z
  Widget _personInfoText() {
    return Obx((){
       if(Get.find<AppState>().loginState.value==LoginState.LOGIN){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //用户名
              Text(
                Global.userProfile.username,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5.h,
              ),
              GetX<UserInfoController>(
                init: Get.put<UserInfoController>(UserInfoController()),
                initState: (_){
                  Get.find<UserInfoController>().getUserCoin();
                  Get.find<UserInfoController>().getMessage();
                },
                builder: (controller){
                  return Row(
                    children: [
                      //等级
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        child: Text(
                          "lv ${controller.coin.level}",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent[200].withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      //积分
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        child: Text(
                          "积分 ${controller.coin.coinCount}",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                      )
                    ],
                  );
                },
              )
            ],
          );
       }
       return Expanded(
           child: InkWell(
             child: Text(
               "立即登录",
               style: TextStyle(
                   fontSize: 18.sp,
                   fontWeight: FontWeight.bold,
                   color: Colors.black87),
             ),
             onTap: (){
               Get.toNamed(RoutesConfig.LOGIN_PAGE);
             },
           ));

    });

  }

  Widget _personQRcode() {
    return Obx((){
      if(Get.find<AppState>().loginState.value==LoginState.LOGIN){
        return Expanded(
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.message_outlined,
                    size: 25.w,
                  ),
                  onPressed: () {
                   //TODO:显示消息列表
                    Get.toNamed(RoutesConfig.MESSAGE_LIST_PAGE);
                  }),
              Positioned(
                child: Container(
                    width: 15.w,
                    alignment: Alignment.center,
                    child:Get.find<UserInfoController>().messageCount>0?CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(
                          Get.find<UserInfoController>().messageCount.toString()
                      ),
                    ):null
                ),
                top:-5.0,
                right: 5,
              )
            ],
          ),
        );
      }
      return Container();
    });
  }

  Widget _buildTopUIPage(){
    Color  iconTextWidgetColor = Theme.of(context).textTheme.headline3.color;
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          //背景
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(
                5.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextWidget.builder(Icons.collections_outlined,"收藏",mainAixSpacing:10.w,labelColor: iconTextWidgetColor,
            onTap: (){
              Get.toNamed(RoutesConfig.PERSON_COLLECTION_PAGE);
            }),
            IconTextWidget.builder(Icons.share,"分享",mainAixSpacing: 10.w,labelColor: iconTextWidgetColor,
              onTap: (){
                Get.toNamed(RoutesConfig.PERSON_SHARE_PAGE);
              },
            ),
            IconTextWidget.builder(Icons.stars_outlined,"积分",mainAixSpacing: 10.w,labelColor: iconTextWidgetColor,
              onTap: (){
                Get.toNamed(RoutesConfig.PERSON_STARTS_PAGE);
              },
            ),
            IconTextWidget.builder(Icons.leaderboard_outlined,"排行榜",mainAixSpacing: 10.w,labelColor: iconTextWidgetColor,
              onTap: (){
                Get.toNamed(RoutesConfig.STARTS_LEADERBOARD_PAGE);
              },
            ),
            IconTextWidget.builder(Icons.access_time,"浏览历史",mainAixSpacing:10.w,labelColor: iconTextWidgetColor),
          ],
        ),
      ),
    );
  }
  //常用工具
  Widget _commonUIPage() {
    Color  iconTextWidgetColor = Theme.of(context).textTheme.headline3.color;
    return SliverToBoxAdapter(
      child: Container(
        height: 200.h,
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            //背景
            color:Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(
                5.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //标题
            Text(
              "常用工具",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child:  GridView.count(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: [
                  IconTextWidget.builder(Icons.fiber_smart_record,"google仓库",mainAixSpacing: mainAixSpacing,labelColor: iconTextWidgetColor),
                  IconTextWidget.builder(Icons.wysiwyg,"TODO",mainAixSpacing: mainAixSpacing,labelColor: iconTextWidgetColor),
                  IconTextWidget.builder(Icons.date_range,"日历",mainAixSpacing: mainAixSpacing,labelColor: iconTextWidgetColor),
                  IconTextWidget.builder(Icons.send,"快递",mainAixSpacing: mainAixSpacing,labelColor: iconTextWidgetColor,onTap: (){
                    Get.toNamed(RoutesConfig.EXPRESS_DELIVERY_PAGE);
                  },),
                  IconTextWidget.builder(Icons.wb_sunny_rounded,"天气",mainAixSpacing: mainAixSpacing,labelColor: iconTextWidgetColor),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

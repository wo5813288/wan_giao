import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/compents/icon_text_widget.dart';
import 'package:wan_android/controller/person/user_info_controller.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/route/routes_page.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage>
    with AutomaticKeepAliveClientMixin {
  double mainAixSpacing = 5.w;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color:Get.isDarkMode ? Colors.grey : Colors.black.withOpacity(0.7)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            _buildNoticeButton(),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Get.toNamed(RoutesConfig.SETTING_PAGE);
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            children: [
              _buildPersonTop(),
              Line(),
              _buildTopUIPage(),
              Line(),
              _commonUIPage()
            ],
          ),
        ));
  }

  ///创建个人头像信息
  Widget _buildPersonTop() {
    return Container(
      padding: EdgeInsets.only(left:10.w,right: 10.w, bottom: 5.h, top: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //个人信息
          _personInfoText(),
          //头像
          Container(
              width: 50.w,
              height: 50.w,
              //加一个头像的边框
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:AssetImage("assets/icon/ic_default_avatar.jpg"),)),
        ],
      ),
    );
  }

  Widget _buildNoticeButton(){
    return Obx((){
      if(appState.isLogin){
        return Expanded(
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    size: 25.w,
                  ),
                  onPressed: () {
                    //显示消息列表
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

  ///个人信息详情Z
  Widget _personInfoText() {
    return Obx(() {
      if (appState.isLogin) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //用户名
            Text(
              Global.userProfile.username,
              style:Theme.of(context).textTheme.headline1
            ),
            SizedBox(
              height: 10.h,
            ),
            GetX<UserInfoController>(
              init: Get.put<UserInfoController>(UserInfoController()),
              builder: (controller) {
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
                          color: Colors.blueAccent[200].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    //积分
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
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
              style: Theme.of(context).textTheme.headline1,
            ),
            onTap: (){
              Get.toNamed(RoutesConfig.LOGIN_PAGE);
            },
      ));
    });
  }


  Widget _buildTopUIPage() {
    Color iconTextWidgetColor = Theme.of(context).textTheme.headline3.color;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          //背景
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(5.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconTextWidget.builder(Icons.collections_outlined, "收藏",
              mainAixSpacing: 10.w, labelColor: iconTextWidgetColor, onTap: () {
            Get.toNamed(RoutesConfig.PERSON_COLLECTION_PAGE);
          }),
          IconTextWidget.builder(
            Icons.share,
            "分享",
            mainAixSpacing: 10.w,
            labelColor: iconTextWidgetColor,
            onTap: () {
              Get.toNamed(RoutesConfig.PERSON_SHARE_PAGE);
            },
          ),
          IconTextWidget.builder(
            Icons.stars_outlined,
            "积分",
            mainAixSpacing: 10.w,
            labelColor: iconTextWidgetColor,
            onTap: () {
              Get.toNamed(RoutesConfig.PERSON_STARTS_PAGE);
            },
          ),
          IconTextWidget.builder(
            Icons.leaderboard_outlined,
            "排行榜",
            mainAixSpacing: 10.w,
            labelColor: iconTextWidgetColor,
            onTap: () {
              Get.toNamed(RoutesConfig.STARTS_LEADERBOARD_PAGE);
            },
          ),
          IconTextWidget.builder(Icons.access_time, "浏览历史",
              mainAixSpacing: 10.w, labelColor: iconTextWidgetColor),
        ],
      ),
    );
  }

  //常用工具
  Widget _commonUIPage() {
    Color iconTextWidgetColor = Theme.of(context).textTheme.headline3.color;
    return Container(
      height: 200.h,
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //标题
          Text(
            "常用工具",
            style: Theme.of(context).textTheme.headline2
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                IconTextWidget.builder(Icons.fiber_smart_record, "google仓库",
                    mainAixSpacing: mainAixSpacing,
                    labelColor: iconTextWidgetColor),
                IconTextWidget.builder(Icons.wysiwyg, "TODO",
                    mainAixSpacing: mainAixSpacing,
                    labelColor: iconTextWidgetColor),
                IconTextWidget.builder(Icons.date_range, "日历",
                    mainAixSpacing: mainAixSpacing,
                    labelColor: iconTextWidgetColor),
                IconTextWidget.builder(
                  Icons.send,
                  "快递",
                  mainAixSpacing: mainAixSpacing,
                  labelColor: iconTextWidgetColor,
                  onTap: () {
                    Get.toNamed(RoutesConfig.EXPRESS_DELIVERY_PAGE);
                  },
                ),
                IconTextWidget.builder(Icons.wb_sunny_rounded, "天气",
                    mainAixSpacing: mainAixSpacing,
                    labelColor: iconTextWidgetColor),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class Line extends StatelessWidget {
  const Line({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.h,
      color: Colors.grey.withOpacity(0.2),
    );
  }
}

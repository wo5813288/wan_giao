import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/user_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/icon_text_widget.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/main.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/util/event_bus_util.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';

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
      flexibleSpace: FlexibleSpaceBar(background: Consumer<UserViewModel>(
        builder: (context, model, _) {
          EventBusUtil.listenEvent<UserEvent>((event) {
            model.setLoginState(event.isLogin);
          });
          return Stack(
            children: [
              model.isLogin
                  ? Image.network(
                      "https://p5.ssl.qhimgs1.com/sdr/400__/t01c17aaee52c2cbcff.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity)
                  : Image.asset(
                      "assets/icon/ic_default_avatar.png",
                      fit: BoxFit.cover,
                      width: double.infinity),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: _buildPersonTop(model))
            ],
          );
        },
      )),
      expandedHeight: 200.h,
    );
  }

  ///创建个人头像信息
  Widget _buildPersonTop(UserViewModel model) {
    return Container(
      height: 80.h,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
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
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:model.isLogin?
              NetworkImage("https://p5.ssl.qhimgs1.com/sdr/400__/t01c17aaee52c2cbcff.jpg")
                  :AssetImage("assets/icon/ic_default_avatar.png"),
            ),
          ),
          SizedBox(width: 10.w),
          //个人信息
          _personInfoText(model),
          //二维码
          _personQRcode(model)
        ],
      ),
    );
  }

  ///个人信息详情Z
  Widget _personInfoText(UserViewModel model) {
    return model.isLogin
        ? Column(
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
              ProviderWidget<PersonViewModel>(
                model: PersonViewModel(),
                builder: (context, personViewModel, _) {
                  return Row(
                    children: [
                      //等级
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        child: Text(
                          "lv ${personViewModel.coin==null?0:personViewModel.coin.level}",
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
                          "积分 ${personViewModel.coin == null ? 0 : personViewModel.coin.coinCount}",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                      )
                    ],
                  );
                },
                onReadyMore: (personViewModel) {
                  personViewModel.getUserCoin();
                },
              )
            ],
          )
        : Expanded(
            child: InkWell(
            child: Text(
              "立即登录",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            onTap: () async {
              var result = await Get.toNamed(RoutesConfig.LOGIN_PAGE);
              if (result) {
                //成功登录，重新请求数据没更新页面状态
                model.setLoginState(true);
              }
            },
          ));
  }

  Widget _personQRcode(UserViewModel model) {
    return model.isLogin
        ? Expanded(
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.qr_code_outlined,
                      size: 25.w,
                    ),
                    onPressed: () {
                      Get.snackbar("title", "个人信息二维码");
                    })
              ],
            ),
          )
        : Container();
  }

  Widget _buildTopUIPage(){
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          //背景
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                5.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextWidget.builder(Icons.collections_outlined,"收藏",mainAixSpacing:10.w,
            onTap: (){
              Get.toNamed(RoutesConfig.PERSON_COLLECTION_PAGE);
            }),
            IconTextWidget.builder(Icons.share,"分享",mainAixSpacing: 10.w,
              onTap: (){
                Get.toNamed(RoutesConfig.PERSON_SHARE_PAGE);
              },
            ),
            IconTextWidget.builder(Icons.stars_outlined,"积分",mainAixSpacing: 10.w,
              onTap: (){
                Get.toNamed(RoutesConfig.PERSON_STARTS_PAGE);
              },
            ),
            IconTextWidget.builder(Icons.leaderboard_outlined,"排行榜",mainAixSpacing: 10.w,
              onTap: (){
                Get.toNamed(RoutesConfig.STARTS_LEADERBOARD_PAGE);
              },
            ),
            IconTextWidget.builder(Icons.access_time,"浏览历史",mainAixSpacing:10.w),
          ],
        ),
      ),
    );
  }
  //常用工具
  Widget _commonUIPage() {
    return SliverToBoxAdapter(
      child: Container(
        height: 200.h,
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            //背景
            color: Colors.white,
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
                  IconTextWidget.builder(Icons.fiber_smart_record,"google仓库",mainAixSpacing: mainAixSpacing),
                  IconTextWidget.builder(Icons.wysiwyg,"TODO",mainAixSpacing: mainAixSpacing,),
                  IconTextWidget.builder(Icons.date_range,"日历",mainAixSpacing: mainAixSpacing,),
                  IconTextWidget.builder(Icons.send,"快递",mainAixSpacing: mainAixSpacing,),
                  IconTextWidget.builder(Icons.wb_sunny_rounded,"天气",mainAixSpacing: mainAixSpacing,),
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

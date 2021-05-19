import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/user_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/icon_text_widget.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/main.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  RefreshController _refreshController;
  double mainAixSpacing = ScreenUtil.getInstance().getAdapterSize(5);
  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PersonViewModel(),
        ),
      ],
      child: CustomScrollView(
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
          return Stack(
            children: [
              model.isLogin
                  ? Image.network(
                      "https://p5.ssl.qhimgs1.com/sdr/400__/t01c17aaee52c2cbcff.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity)
                  : Image.network(
                      "https://www.wanandroid.com/resources/image/pc/logo.png",
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
      expandedHeight: ScreenUtil.getInstance().getAdapterSize(200.0),
    );
  }

  ///创建个人头像信息
  Widget _buildPersonTop(UserViewModel model) {
    return Container(
      height: ScreenUtil.getInstance().getAdapterSize(80.0),
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
            width: ScreenUtil.getInstance().getAdapterSize(70),
            height: ScreenUtil.getInstance().getAdapterSize(70),
            //加一个头像的边框
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border:
                    Border.all(width: 2.5, color: Colors.grey.withOpacity(0.5)),
                color: Colors.grey[200].withOpacity(0.5)),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(model.isLogin
                  ? "https://p5.ssl.qhimgs1.com/sdr/400__/t01c17aaee52c2cbcff.jpg"
                  : "https://www.wanandroid.com/resources/image/pc/logo.png"),
            ),
          ),
          SizedBox(width: ScreenUtil.getInstance().getAdapterSize(10.0)),
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
                SpUtil.getObject(ConstantInfo.KEY_USER)['username'],
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getSp(18.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().getAdapterSize(5.0),
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
                          "lv 10",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent[200].withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(
                        width: ScreenUtil.getInstance().getAdapterSize(5.0),
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
                  fontSize: ScreenUtil.getInstance().getSp(18.0),
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
                      size: ScreenUtil.getInstance().getAdapterSize(25.0),
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
        padding: EdgeInsets.all(ScreenUtil.getInstance().getAdapterSize(10)),
        margin: EdgeInsets.all(ScreenUtil.getInstance().getAdapterSize(10)),
        decoration: BoxDecoration(
          //背景
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                ScreenUtil.getInstance().getAdapterSize(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextWidget.builder(Icons.star_border,"收藏",mainAixSpacing: ScreenUtil.getInstance().getAdapterSize(10),
            onTap: (){
              Fluttertoast.showToast(msg: "收藏");
            }),
            IconTextWidget.builder(Icons.compare_sharp,"积分",mainAixSpacing: ScreenUtil.getInstance().getAdapterSize(10)),
            IconTextWidget.builder(Icons.access_time,"浏览历史",mainAixSpacing: ScreenUtil.getInstance().getAdapterSize(10)),
            IconTextWidget.builder(Icons.download_outlined,"下载管理",mainAixSpacing: ScreenUtil.getInstance().getAdapterSize(10)),
          ],
        ),
      ),
    );
  }
  //常用工具
  Widget _commonUIPage() {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil.getInstance().getAdapterSize(200),
        padding: EdgeInsets.all(ScreenUtil.getInstance().getAdapterSize(10)),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            //背景
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                ScreenUtil.getInstance().getAdapterSize(5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //标题
            Text(
              "常用工具",
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().getSp(17),
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: ScreenUtil.getInstance().getAdapterSize(10)),
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
}

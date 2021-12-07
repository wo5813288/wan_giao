import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/dialog_util.dart';
import 'package:wan_android/compents/icon_font.dart';
import 'package:wan_android/page/person/person_page.dart';
import 'package:wan_android/page/person/person_page2.dart';
import 'package:wan_android/page/project/project_page.dart';
import 'package:wan_android/page/system/system_page.dart';
import 'package:wan_android/page/we_chat/we_chat_page.dart';
import 'package:wan_android/util/device_util.dart';

import '../home/home_page.dart';

class   IndexPage extends StatefulWidget {

  final _tabs = [
    BottomNavigationBarItem(
      label: "首页",
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: "公众号",
      icon: Icon(IconFont.we_chat),
    ),
    BottomNavigationBarItem(
      label: "体系",
      icon: Icon(Icons.account_tree),
    ),
    BottomNavigationBarItem(
      label: "项目",
      icon: Icon(Icons.apps),
    ),
    BottomNavigationBarItem(
      label: "我的",
      icon: Icon(Icons.person),
    ),
  ];

  final List<Widget> _pages = [
    HomePage(),
    WeChatPage(),
    SystemPage(),
    ProjectPage(),
    PersonPage()
  ];

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  PageController _pageController;
  int _pageIndex = 0;
  DateTime _lastDateTime;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if(!SpUtil.getBool(ConstantInfo.KEY_AGREE_PRIVACY,defValue: false)){
      //如果没有同意过隐私协议
      Future.delayed(Duration(seconds: 1),() async{
        bool agree = await showPrivacyDialog();
        if(!agree){
          DeviceUtil.popApp();
          return;
        }
        SpUtil.putBool(ConstantInfo.KEY_AGREE_PRIVACY, true);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        bottomNavigationBar: createBottomUI(),
        ///使用PageView结合AutomaticKeepAliveClientMixin页面切换时
        ///保存页面数据状态
        body: WillPopScope(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            children: widget._pages,
            controller: _pageController,
          ),
          onWillPop: (){
            if(_lastDateTime==null||DateTime.now().difference(_lastDateTime)>Duration(seconds: 1)){
              _lastDateTime = DateTime.now();
              showToast("再次点击退出程序",backgroundColor: Theme.of(context).primaryColor,position: ToastPosition.center);
              return Future.value(false);
            }
            return Future.value(true);
          },
        )
    );
  }

  Widget createBottomUI() {
    return BottomNavigationBar(
      items: widget._tabs,
      currentIndex: _pageIndex,
      backgroundColor: Theme.of(context).bottomAppBarColor,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _pageIndex = index;
          _pageController.jumpToPage(_pageIndex);
        });
      },
    );
  }
}

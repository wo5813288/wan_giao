import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/compents/icon_font.dart';
import 'package:wan_android/controller/login_controller.dart';
import 'package:wan_android/page/login/login_page.dart';
import 'package:wan_android/page/person/person_page.dart';
import 'package:wan_android/page/project/project_page.dart';
import 'package:wan_android/page/system/system_page.dart';
import 'package:wan_android/page/we_chat/we_chat_page.dart';

import 'home/home_page.dart';

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
  @override
  void initState() {
    super.initState();
    _pageController = PageController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: createBottomUI(),
        ///使用PageView结合AutomaticKeepAliveClientMixin页面切换时
        ///保存页面数据状态
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: widget._pages,
          controller: _pageController,
        ));
  }

  Widget createBottomUI() {
    return BottomNavigationBar(
      items: widget._tabs,
      currentIndex: _pageIndex,
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

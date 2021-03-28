import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/page/home_page.dart';

class IndexPage extends StatefulWidget {
  int _pageIndex = 0;
  final _tabs = [
    BottomNavigationBarItem(
      label: "首页",
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: "问答",
      icon: Icon(Icons.question_answer),
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
    Center(
      child: Text("22"),
    ),
    Center(
      child: Text("33"),
    ),
    Center(
      child: Text("44"),
    ),
    Center(
      child: Text("55"),
    ),
  ];

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
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
      currentIndex: widget._pageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          widget._pageIndex = index;
          _pageController.jumpToPage(widget._pageIndex);
        });
      },
    );
  }
}

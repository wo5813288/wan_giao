import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/page/home/question_page.dart';
import 'package:wan_android/page/home/recommend_page.dart';
import 'package:wan_android/page/home/square_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  TabController _tabController;

  ///重写此方法 保存页面数据状态，防止切换页面后数据重新加载，另外需要配合PageView使用
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this,initialIndex: 1);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _buildTopBarUI(context),
          body: TabBarView(
            controller: _tabController,
            children: [ SquarePage(),RecommendPage(), QuestionPage()],
          )),
    );
  }

  ///头部搜索框
  Widget _buildTopBarUI(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 100),
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [_buildTabItemUI(), _buildSearchViewUI()],
        ),
      ),
    );
  }

  ///创建顶部的tab
  Widget _buildTabItemUI() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TabBar(
        isScrollable: true,
        controller: _tabController,
        indicator: const BoxDecoration(),
        labelStyle: TextStyle(fontSize: 20, height: 2),
        unselectedLabelStyle: TextStyle(
          fontSize: 15,
        ),
        tabs: [
          Tab(
            child: Text("广场"),
          ),
          Tab(
            child: Text("推荐"),
          ),
          Tab(
            child: Text("问答"),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchViewUI() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 35,
      child: TextField(
        enabled: false,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            //输入文字后面的小图标
            fillColor: Color(0xFFF5F5F5),
            filled: true,
            hintText: "搜索关键词",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            )),
      ),
    );
  }
}

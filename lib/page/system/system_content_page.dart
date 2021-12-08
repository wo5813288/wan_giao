import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/tip_data.dart';
import 'package:wan_android/compents/constant.dart';
import 'package:wan_android/page/system/system_content_list_page.dart';

class SystemContentPage extends StatefulWidget {
  @override
  _SystemContentPageState createState() => _SystemContentPageState();
}

class _SystemContentPageState extends State<SystemContentPage> with TickerProviderStateMixin {
  TabController _tabController;
  TipItem _tipItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //默认初始化的被选中的项
    int initIndex = Get.arguments[SystemConstant.SELECT_TITLE_INDEX];
    //需要显示的TipItem
    _tipItem = Get.arguments[SystemConstant.SELECT_TITLE];
    _tabController = TabController(length: _tipItem.children.length, vsync: this, initialIndex: initIndex);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tipItem.children.length,
        child: Scaffold(
            appBar: AppBar(
              brightness: Brightness.dark,
              centerTitle: true,
              title: Text(_tipItem.name),
              bottom: _buildTabItemUI(_tipItem.children),
            ),
            body: TabBarView(
              children: _tipItem.children.map((e) {
                return SystemContentListPage(e.id.toString());
              }).toList(),
              controller: _tabController,
            )));
  }

  Widget _buildTabItemUI(List tipItems) {
    return TabBar(
      isScrollable: true,
      tabs: tipItems.map((e) {
        return Tab(
          text: e.name,
        );
      }).toList(),
      controller: _tabController,
    );
  }
}

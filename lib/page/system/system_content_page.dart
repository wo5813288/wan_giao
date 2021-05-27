import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/tip_data.dart';
import 'package:wan_android/bean/we_chat_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/page/system/system_content_list_page.dart';
import 'package:wan_android/page/we_chat/we_chat_content_page.dart';
import 'package:wan_android/viewmodel/we_chat_view_model.dart';

class SystemContentPage extends StatefulWidget {
  @override
  _SystemContentPageState createState() => _SystemContentPageState();
}

class _SystemContentPageState extends State<SystemContentPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
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
    _tabController = TabController(length: _tipItem.children.length,vsync: this,initialIndex: initIndex);
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: _tipItem.children.length,
      child: Builder(
        builder: (context) {
          return Scaffold(
              appBar: AppBar(
                brightness: Brightness.dark,
                centerTitle: true,
                title: Text(_tipItem.name),
                bottom: _buildTabItemUI(_tipItem.children),
              ),
              body: Builder(
                builder: (context) {
                  //成功加载数据后
                  return TabBarView(
                    children: _tipItem.children.map((e) {
                      return SystemContentListPage(e.id.toString());
                    }).toList(),
                    controller: _tabController,
                  );
                },
              ));
        },
      ),
    );
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

  @override
  bool get wantKeepAlive => true;
}

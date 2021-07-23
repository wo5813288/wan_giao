import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/controller/wechat/we_chat_controller.dart';
import 'package:wan_android/page/we_chat/we_chat_content_page.dart';
import 'package:wan_android/compents/state_page.dart';

class WeChatPage extends StatefulWidget {
  @override
  _WeChatPageState createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  var _weChatController = Get.put<WeChatController>(WeChatController());
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: _weChatController.weChats.length,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          centerTitle: true,
          title:Obx((){
            return _buildTabItemUI(_weChatController.weChats);
          })
        ),
        body: GetX<WeChatController>(
          initState: (_){
            _weChatController.getWehChatData();
          },
          builder: (_){
            _tabController = TabController(
                length: _weChatController.weChats.length,
                initialIndex: _weChatController.iniItemIndex,
                vsync: this);
            _tabController.addListener(() {
              _weChatController.iniItemIndex = _tabController.index;
            });
            return StateCommonPage<WeChatController>(
              model:_weChatController ,
              onPressed: (){
                _weChatController.getWehChatData();
              },
              child: TabBarView(
                children: _weChatController.weChats.map((e) {
                  return WeChatContentPage(e.id.toString());
                }).toList(),
                controller: _tabController,
              ),
            );
          },
        ),
      ),
    );
  }
  //创建顶部横向列表tab
  Widget _buildTabItemUI(List weChats) {
    return TabBar(
      isScrollable: true,
      tabs: weChats.map((e) {
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

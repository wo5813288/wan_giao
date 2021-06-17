import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/controller/we_chat_controller.dart';
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
    return GetX<WeChatController>(
      initState: (_){
        _weChatController.getWehChatData();
      },
      builder: (_){
        _tabController = TabController(length: _weChatController.weChats.length, vsync: this);
        return DefaultTabController(
          length: _weChatController.weChats.length,
          child: Scaffold(
              appBar: AppBar(
                brightness: Brightness.dark,
                centerTitle: true,
                title: _buildTabItemUI(_weChatController.weChats),
              ),
            body:  Builder(
              builder: (context) {
                if(_weChatController.loadState.value==LoadState.LOADING){
                  return LoadingPage();
                }
                if (_weChatController.loadState.value == LoadState.EMPTY) {
                  return EmptyPage(onPressed: (){
                    _weChatController.getWehChatData();
                  });
                } else if (_weChatController.loadState.value == LoadState.FAILURE) {
                  return NetWorkErrorPage(onPressed: (){
                    _weChatController.getWehChatData();
                  },);
                }
                //成功加载数据后
                return TabBarView(
                  children: _weChatController.weChats.map((e) {
                    return WeChatContentPage(e.id.toString());
                  }).toList(),
                  controller: _tabController,
                );
              },
            ))
        );
      },
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

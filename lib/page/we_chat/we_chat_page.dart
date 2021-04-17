
import 'package:flutter/material.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/we_chat_data.dart';
import 'package:wan_android/model/we_chat_model.dart';
import 'package:wan_android/page/we_chat/we_chat_content_page.dart';

class WeChatPage extends StatefulWidget {
  @override
  _WeChatPageState createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  List<WeChat> _weChats = [];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    WeChatModel.getWehChatData().then((value){
      setState(() {
        _weChats = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    _tabController = new TabController(length: _weChats.length,vsync: this);
    super.build(context);
    return DefaultTabController(
      length: _weChats.length,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          centerTitle: true,
          title: Text(
            "公众号",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
            ),
          ),
          bottom: _buildTabItemUI(),
        ),
        body: TabBarView(
          children: _weChats.map((e){
            return WeChatContentPage(e.id.toString());
          }).toList(),
          controller: _tabController,
        ),
      ),
    );
  }
  Widget _buildTabItemUI(){
    return TabBar(
      isScrollable: true,
      tabs: _weChats.map((e){
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

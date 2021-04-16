
import 'package:flutter/material.dart';

class WeChatPage extends StatefulWidget {
  @override
  _WeChatPageState createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  List<Tab> _tabs = [];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _tabs.length,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: _tabs.length,
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
      ),
    );
  }
  Widget _buildTabItemUI(){
    return TabBar(
      tabs: _tabs,
      controller: _tabController,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

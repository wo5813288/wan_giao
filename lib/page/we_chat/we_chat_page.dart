import 'package:flutter/material.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/we_chat_data.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/page/we_chat/we_chat_content_page.dart';
import 'package:wan_android/viewmodel/we_chat_view_model.dart';

class WeChatPage extends StatefulWidget {
  @override
  _WeChatPageState createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<WeChatTabData>(
      model: WeChatTabData(),
      onReadyMore: (model) {
        model.getWehChatData();
      },
      builder: (context, model, child) {
        return DefaultTabController(
          length: model.weChats.length,
          child: Builder(
            builder: (context) {
              _tabController = TabController(length: model.weChats.length, vsync: this);
              return Scaffold(
                  appBar: AppBar(
                    brightness: Brightness.dark,
                    centerTitle: true,
                    title: _buildTabItemUI(model.weChats),
                  ),
                  body: Builder(
                    builder: (context) {
                      if (model.loadState == LoadState.EMPTY) {
                        return EmptyPage(onPressed: (){
                          model.getWehChatData();
                        });
                      } else if (model.loadState == LoadState.FAILURE) {
                        return NetWorkErrorPage(onPressed: (){
                          model.getWehChatData();
                        },);
                      }
                      //成功加载数据后
                      return TabBarView(
                        children: model.weChats.map((e) {
                          return WeChatContentPage(e.id.toString());
                        }).toList(),
                        controller: _tabController,
                      );
                    },
                  ));
            },
          ),
        );
      },
    );
  }

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

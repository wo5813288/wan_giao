


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/bean/message_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/base_getx_controller.dart';
import 'package:wan_android/controller/message_list_new_controller.dart';
import 'package:wan_android/controller/message_list_readed_controller.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/theme/app_color.dart';
import 'package:wan_android/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MessageListPage extends StatefulWidget {
  const MessageListPage({Key key}) : super(key: key);

  @override
  MessageListPageState createState() => MessageListPageState();
}

class MessageListPageState extends State with TickerProviderStateMixin {
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    _tabController= TabController(length: 2, vsync: this);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          iconTheme: IconThemeData(
              color: SpUtil.getString(ThemeKey.KEY_APP_THEME)==ThemeKey.LIGHT?Colors.black:Colors.grey
          ),
          title: Text(
            "消息通知",
            style: TextStyle(
                color: SpUtil.getString(ThemeKey.KEY_APP_THEME)==ThemeKey.LIGHT?Colors.black:Colors.grey
            ),
          ),
          centerTitle: true,
          backgroundColor: SpUtil.getString(ThemeKey.KEY_APP_THEME)==ThemeKey.LIGHT?Colors.white:Colors.black,
          bottom: TabBar(
            isScrollable: false,
            controller: _tabController,
            tabs: [
              Tab(child:Text(
                "新消息",
                style: TextStyle(
                    color: SpUtil.getString(ThemeKey.KEY_APP_THEME)==ThemeKey.LIGHT?Colors.black:Colors.grey
                ),
              )),
              Tab(child: Text(
                "历史消息",
                style: TextStyle(
                    color: SpUtil.getString(ThemeKey.KEY_APP_THEME)==ThemeKey.LIGHT?Colors.black:Colors.grey
                ),
              ),)
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            MessageListNewContentPage(),
            MessageListContentPage(),
          ],
        )

      ),
    );
  }
}

class MessageListContentPage extends StatefulWidget {
  const MessageListContentPage({Key key}) : super(key: key);

  @override
  MessageListContentPageState createState() => MessageListContentPageState();
}

class MessageListContentPageState extends State<MessageListContentPage> with AutomaticKeepAliveClientMixin {
  MessageListController _controller = Get.find<MessageListController>();
  @override
  Widget build(BuildContext context) {
    return _bodyContent();
  }
  Widget _bodyContent(){
    return Ink(
      color: KColors.kMessageBgLightColor,
      padding: EdgeInsets.all(5.w),
      child: GetX<MessageListController>(
        initState: (_){
          _controller.initData(true);
        },
        builder: (_){
          return StatePageWithViewController<MessageListController>(
              model:_controller,
              controller: _controller.refreshController,
              onPressed: (){
                _controller.initData(true);
              },
              onRefresh: () async{
                _controller.refresh();
              },
              onLoading: () async{
                _controller.getMessageList(false);
              },
              child:ListView.builder(
                itemBuilder: (context, index) {
                  return _buildListItemUI(_controller.messageItems[index]);
                },
                itemCount:_controller.messageItems.length,
              )
          );
        },
      ),
    );
  }
  Widget _buildListItemUI(Message messageItem) {
    return Container(
        margin: EdgeInsets.only(top: 30.h),
        child: messageItem.category==1?_commentUI(messageItem):_newAnswer(messageItem)
    );
  }
  Widget _commentUI(Message messageItem){
    return Column(
      children: [
        Text(messageItem.niceDate,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5.h),
        InkWell(
          onTap: (){
            Get.toNamed(RoutesConfig.WEB_PAGE,arguments: { ConstantInfo.ARTICLE_URL:messageItem.fullLink});
          },
          child: Ink(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5.w)),color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(messageItem.fromUser,
                          style: TextStyle(color: Colors.blue)),
                      Text(messageItem.title, style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(messageItem.message,style: TextStyle(color: Colors.black)),
                ],
              )
          ),
        )
      ],
    );
  }

  Widget _newAnswer(Message messageItem){
    return Column(
      children: [
        Text(messageItem.niceDate,
            textAlign: TextAlign.right, style: TextStyle(color: Colors.black)),
        SizedBox(height: 5.h),
        InkWell(
          onTap: (){
            Get.toNamed(RoutesConfig.WEB_PAGE,arguments: { ConstantInfo.ARTICLE_URL:messageItem.fullLink});
          },
          child: Ink(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.w)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(text: messageItem.fromUser,style: TextStyle(color: Colors.blue)),
                            TextSpan(text:messageItem.title,
                                style: TextStyle(color: Colors.black)),
                          ]
                      )
                  ),
                  SizedBox(height: 5.h),
                  Text('"'+messageItem.message+'"', style: TextStyle(color: Colors.black)),
                ],
              )
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class MessageListNewContentPage extends StatefulWidget {
  const MessageListNewContentPage({Key key}) : super(key: key);

  @override
  MessageListNewContentPageState createState() => MessageListNewContentPageState();
}

class MessageListNewContentPageState extends State<MessageListNewContentPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return _bodyContent();
  }
  Widget _bodyContent(){
    MessageListNewController _controller = Get.find<MessageListNewController>();
    return Ink(
      color: KColors.kMessageBgLightColor,
      padding: EdgeInsets.all(5.w),
      child: GetX<MessageListNewController>(
        initState: (_){
          _controller.initData(true);
        },
        builder: (_){
          return StatePageWithViewController<MessageListNewController>(
              model:Get.find<MessageListNewController>(),
              controller: Get.find<MessageListNewController>().refreshController,
              onPressed: (){
                _controller.initData(true);
              },
              onRefresh: () async{
                _controller.refresh();
              },
              onLoading: () async{
                _controller.getMessageList(false);
              },
              child:ListView.builder(
                itemBuilder: (context, index) {
                  return _buildListItemUI(_controller.messageItems[index]);
                },
                itemCount:_controller.messageItems.length,
              )
          );
        },
      ),
    );
  }
  Widget _buildListItemUI(Message messageItem) {
    return Container(
        margin: EdgeInsets.only(top: 30.h),
        child: messageItem.category==1?_commentUI(messageItem):_newAnswer(messageItem)
    );
  }
  Widget _commentUI(Message messageItem){
    return Column(
      children: [
        Text(messageItem.niceDate,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5.h),
        InkWell(
          onTap: (){
            Get.toNamed(RoutesConfig.WEB_PAGE,arguments: { ConstantInfo.ARTICLE_URL:messageItem.fullLink});
          },
          child: Ink(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5.w)),color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(messageItem.fromUser,
                          style: TextStyle(color: Colors.blue)),
                      Text(messageItem.title, style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(messageItem.message,style: TextStyle(color: Colors.black)),
                ],
              )
          ),
        )
      ],
    );
  }

  Widget _newAnswer(Message messageItem){
    return Column(
      children: [
        Text(messageItem.niceDate,
            textAlign: TextAlign.right, style: TextStyle(color: Colors.black)),
        SizedBox(height: 5.h),
        InkWell(
          onTap: (){
            Get.toNamed(RoutesConfig.WEB_PAGE,arguments: { ConstantInfo.ARTICLE_URL:messageItem.fullLink});
          },
          child: Ink(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.w)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(text: messageItem.fromUser,style: TextStyle(color: Colors.blue)),
                            TextSpan(text:messageItem.title,
                                style: TextStyle(color: Colors.black)),
                          ]
                      )
                  ),
                  SizedBox(height: 5.h),
                  Text('"'+messageItem.message+'"', style: TextStyle(color: Colors.black)),
                ],
              )
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}


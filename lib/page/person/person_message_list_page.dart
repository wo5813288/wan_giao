


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/bean/message_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/message_list_controller.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/theme/app_color.dart';
import 'package:wan_android/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MessageListPage extends GetView<MessageListController> {
  const MessageListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: _bodyContent(),

    );
  }

  Widget _bodyContent(){
    return Ink(
      color: KColors.kMessageBgLightColor,
      padding: EdgeInsets.all(5.w),
      child: GetX(
        init: controller,
        initState: (_){
          controller.initData(true);
        },
        builder: (_){
          return StatePageWithViewController<MessageListController>(
              model:controller,
              controller: controller.refreshController,
              onPressed: (){
                controller.initData(true);
              },
              onRefresh: () async{
                controller.refresh();
              },
              onLoading: () async{
                controller.getMessageList(false);
              },
              child:ListView.builder(
                itemBuilder: (context, index) {
                  return _buildListItemUI(controller.messageItems[index]);
                },
                itemCount:controller.messageItems.length,
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
}

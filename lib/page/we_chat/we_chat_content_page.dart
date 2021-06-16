
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/controller/we_chat_controller.dart';
import 'file:///D:/androidwork/wan_android_flutter/lib/compents/state_page.dart';

class WeChatContentPage extends StatefulWidget {
  final String authorId;
  WeChatContentPage(this.authorId);
  @override
  _WeChatContentPageState createState() => _WeChatContentPageState();
}

class _WeChatContentPageState extends State<WeChatContentPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetX<WeChatController>(
      init: Get.put<WeChatController>(WeChatController(),tag: widget.authorId),
      initState: (_){
        var controller =Get.find<WeChatController>(tag: widget.authorId);
        controller.setAuthorId(widget.authorId);
        controller.initData(true);
      },
      builder: (weChatController){
        return StatePageWithViewController<WeChatController>(
          model: Get.find<WeChatController>(tag: widget.authorId),
          controller: Get.find<WeChatController>(tag: widget.authorId).refreshController,
          onPressed: (){
            Get.find<WeChatController>(tag: widget.authorId).getArticleByAuthor(true);
          },
          onRefresh: () async{
            Get.find<WeChatController>(tag: widget.authorId).refresh();
          },
          onLoading: () async{
            Get.find<WeChatController>(tag: widget.authorId).getArticleByAuthor(false);
          },
          child:ListView.builder(
            itemBuilder: (context, index) {
              return HomeListItemUI(
                articleItem: Get.find<WeChatController>(tag: widget.authorId).articleItems[index],
              );
            },
            itemCount:  Get.find<WeChatController>(tag: widget.authorId).articleItems.length,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

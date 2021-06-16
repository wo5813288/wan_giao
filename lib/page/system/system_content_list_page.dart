
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/controller/system_controller.dart';
import 'file:///D:/androidwork/wan_android_flutter/lib/compents/state_page.dart';

class SystemContentListPage extends StatefulWidget {
  final String cid;
  SystemContentListPage(this.cid,{Key key}):super(key: key);

  @override
  _SystemContentListPageState createState() => _SystemContentListPageState();
}

class _SystemContentListPageState extends State<SystemContentListPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<SystemContentController>(
      //加上tag属性，不然每次调用Get.find<SystemContentController>找到的都是同一个对象，那么refreshcontroller和loadstate会有冲突
      init: Get.put<SystemContentController>(SystemContentController(),tag: widget.cid),
      initState: (_){
        Get.find<SystemContentController>(tag: widget.cid).setCid(widget.cid);
        Get.find<SystemContentController>(tag: widget.cid).initData(true);
      },
      builder: (_){
        return StatePageWithViewController<SystemContentController>(
          model:  Get.find<SystemContentController>(tag: widget.cid),
          controller:  Get.find<SystemContentController>(tag: widget.cid).refreshController,
          onPressed: (){
            Get.find<SystemContentController>(tag: widget.cid).initData(true);
          },
          onRefresh: () async{
            Get.find<SystemContentController>(tag: widget.cid).refresh();
          },
          onLoading: () async{
            Get.find<SystemContentController>(tag: widget.cid).getArticleBySystem(false);
          },
          child:ListView.builder(
            itemBuilder: (context, index) {
              return HomeListItemUI(
                articleItem:  Get.find<SystemContentController>(tag: widget.cid).articleItems[index],
              );
            },
            itemCount:   Get.find<SystemContentController>(tag: widget.cid).articleItems.length,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}


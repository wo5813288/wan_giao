
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/news_item_data.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/news/news_list_controller.dart';

class NewsListContentPage extends StatefulWidget {
  final String newTypeId;
  NewsListContentPage(this.newTypeId);
  @override
  _NewsListContentPageState createState() => _NewsListContentPageState();
}

class _NewsListContentPageState extends State<NewsListContentPage> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<NewsListController>(
      init: Get.put<NewsListController>(NewsListController(),tag: widget.newTypeId),
      initState: (_){
        var controller =Get.find<NewsListController>(tag: widget.newTypeId);
        controller.setNewsTypeId(widget.newTypeId);
        controller.initData(true);
      },
      builder: (_){
        return StatePageWithViewController<NewsListController>(
          model: Get.find<NewsListController>(tag: widget.newTypeId),
          controller: Get.find<NewsListController>(tag: widget.newTypeId).refreshController,
          onPressed: (){
            Get.find<NewsListController>(tag: widget.newTypeId).getNewsList(true);
          },
          onRefresh: () async{
            Get.find<NewsListController>(tag: widget.newTypeId).refresh();
          },
          onLoading: () async{
            Get.find<NewsListController>(tag: widget.newTypeId).getNewsList(false);
          },
          child:ListView.separated(
            itemBuilder: (context, index) {
              return NewsListItemUI(
                 Get.find<NewsListController>(tag: widget.newTypeId).newsContents[index],
              );
            },
            separatorBuilder: (context,index){
              return Divider(thickness: 0.5.h,color: Colors.grey.withOpacity(0.5));
            },
            itemCount:  Get.find<NewsListController>(tag: widget.newTypeId).newsContents.length,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/news_type_data.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/news/news_controller.dart';
import 'package:wan_android/page/news/news_list_content_page.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: Get.find<NewsController>().newsTypes.length,
      child: Scaffold(
        appBar:AppBar(
          brightness: Brightness.dark,
          centerTitle: true,
          title: Obx((){
            return _buildTabItemUI(Get.find<NewsController>().newsTypes);
          }),
        ),
        body: GetX<NewsController>(
          initState: (_){
            Get.find<NewsController>().getNewTypes();
          },
          builder: (_){
            _tabController = TabController(length: Get.find<NewsController>().newsTypes.length,
                vsync: this,initialIndex:  Get.find<NewsController>().iniItemIndex);
            _tabController.addListener(() {
              Get.find<NewsController>().iniItemIndex = _tabController.index;
            });
            return StateCommonPage<NewsController>(
              model: Get.find<NewsController>(),
              onPressed: (){
                Get.find<NewsController>().getNewTypes();
              },
              child: TabBarView(
                children: Get.find<NewsController>().newsTypes.map((e) {
                  return NewsListContentPage(e.typeId.toString());
                }).toList(),
                controller: _tabController,
              ),
            );
          },
        )
      ),
    );
  }
  //创建顶部横向列表tab
  Widget _buildTabItemUI(List<NewsType> newsTypes) {
    return TabBar(
      isScrollable: true,
      tabs: newsTypes.map((e) {
        return Tab(
          text: e.typeName,
        );
      }).toList(),
      controller: _tabController,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

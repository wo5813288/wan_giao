
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          titleSpacing: 0,
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
    return Container(
      child: Row(
       children: [
         Expanded(
           child: TabBar(
             isScrollable: true,
             tabs: newsTypes.map((e) {
               return Tab(
                 text: e.typeName,
               );
             }).toList(),
             controller: _tabController,
           ),
         ),
         ImageFiltered(
           imageFilter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
           child: Container(
             width: 5,
             height: 10,
             color: Colors.blue,
           ),
         ),
         Container(
           margin: EdgeInsets.only(right: 10.w),
           child: InkWell(
             child: Icon(
                 Icons.format_list_bulleted,
                 color: Colors.white
             ),
             onTap: (){
               //底部弹出菜单
               Get.bottomSheet(
                 Container(
                   //二分之一的屏幕高度
                   padding: EdgeInsets.only(top: 20.h),
                   alignment: Alignment.topCenter,
                   height: MediaQuery.of(context).size.height/2,
                   child:Wrap(
                     runSpacing: 15.h,
                     spacing: 15.w,
                     children:Get.find<NewsController>().newsTypes.map((e){
                       return ChoiceChip(
                         label: Text(e.typeName),
                         labelStyle: Theme.of(context).textTheme.bodyText1,
                         selected: _tabController.index==Get.find<NewsController>().newsTypes.indexOf(e),
                         onSelected: (bool){
                           _tabController.index = Get.find<NewsController>().newsTypes.indexOf(e);
                           Get.back();
                         },
                       );
                     }) .toList(),
                   )
                 ),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                 ),
                 backgroundColor: Colors.white
               );
             },
           ),
         )
       ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

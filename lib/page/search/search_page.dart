import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/compents/search_view.dart';
import 'package:wan_android/controller/home/search_controller.dart';
import 'package:wan_android/compents/state_page.dart';

class SearchPage extends GetView<SearchController>{
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (_){
        controller.getSearchHotKey();
      },
      builder: (_){
        return Scaffold(
            appBar:  _buildSearchUI(),
            body:  Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      _buildHotSearchUIList(),
                      _buildSearchHistoryUIList()
                    ],
                  ),
                ),
                controller.isSearching?SearchResultPage(searchController: controller,):Container()
              ],
            )
        );
      },
    );
  }

  ///顶部搜索框
  Widget _buildSearchUI(){
    return PreferredSize(
        preferredSize: Size(ScreenUtil().screenWidth,50.h),
        child: Container(
            height: double.infinity,
            padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight, left: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 30.h,
                    child: SearchView(
                      queryHint: controller.hotKeyList.isEmpty ? "搜索文章"
                          : "${controller.hotKeyList[0].name} | ${controller.hotKeyList[1].name}",
                      enabled: true,
                      suffixIcon:Icons.cancel,
                      textEditingController: _textEditingController,
                      onPressed: (){
                        _textEditingController.clear();
                        controller.setSearching(false);
                      },
                      changed: (value){
                        if(value.isEmpty){
                          controller.setSearching(false);
                        }
                      },
                      submit: (value){
                        controller.setQueryKey(value);
                        controller.setSearching(true);
                      },
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    )
                  ),
                ),
                TextButton(
                  child: Text("取消", style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    controller.setSearching(false);
                    Get.back();
                  },
                )
              ],
            )));
  }

  ///热门搜索
  Widget _buildHotSearchUIList() {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: 5.h,
            horizontal: 10.w),
        child:ChipSearchList(
            model: controller,
            title: "热门搜索",
            onTap:(value){
              //点击了某一项进行搜索
              controller.setQueryKey(value);
              _textEditingController.text = value;
              controller.initData(true);
              controller.setSearching(true);
            }
        )
    );
  }

  ///搜索历史
  Widget _buildSearchHistoryUIList() {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: 5.w,
            horizontal: 10.h),
        child: ChipSearchHistoryList(
            historyList: controller.searchHistory,
            title: "历史记录",
            onTap:(value){
              //点击了某一项进行搜索
              controller.setQueryKey(value);
              _textEditingController.text = value;
              controller.initData(true);
              controller.setSearching(true);
            }
        )
    );
  }
}

class ChipSearchList extends StatelessWidget {
  final SearchController model;
  final String title;
  final Function(String t) onTap;
  ChipSearchList({this.model,this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp),
        ),
        SizedBox(height: 5.h),
        Wrap(
          spacing: 25.w,
          children: model.hotKeyList.map((e) {
            return InkWell(
                child: Chip(
                  backgroundColor: Colors.white24,
                  side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
                  label: Text(e.name),
                ),
                onTap:(){
                  onTap(e.name);
                }
            );
          }).toList(),
        )
      ],
    );
  }
}
class ChipSearchHistoryList extends StatelessWidget {
  final List<String> historyList;
  final String title;
  final Function(String t) onTap;
  ChipSearchHistoryList({this.historyList,this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp),
        ),
        SizedBox(height: 5.h),
        Wrap(
          spacing: 25.w,
          children: historyList.map((e) {
            return InkWell(
                child: Chip(
                  backgroundColor: Colors.white24,
                  side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
                  label: Text(e),
                ),
                onTap:(){
                  onTap(e);
                }
            );
          }).toList(),
        )
      ],
    );
  }
}


class SearchResultPage extends StatelessWidget {
  final SearchController searchController;
  SearchResultPage({Key key,this.searchController}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(
        init: searchController,
        initState: (_){
          searchController.initData(true);
        },
        builder: (_){
          return StatePageWithViewController<SearchController>(
              controller: searchController.refreshController,
              model: searchController,
              enablePullDown: false,
              onLoading: ()async{
                searchController.loadArticleBySearchKey(false);
              },
              child:ListView.builder(
                itemBuilder: (context, index) {
                  return HomeListItemUI(
                    articleItem: searchController.articleItems[index],
                  );
                },
                itemCount:  searchController.articleItems.length,
              )
          );
        },
      )
    );
  }
}

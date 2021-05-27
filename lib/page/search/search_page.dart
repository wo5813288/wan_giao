import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/compents/search_view.dart';
import 'package:wan_android/page/search/search_result_page.dart';
import 'package:wan_android/viewmodel/search_view_model.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String queryKey="";
  TextEditingController _textEditingController = TextEditingController();

  //这里 需要把 _resultViewModel 传到 SearchResultPage页面中，因为SearchResultPage页面中
  //initState只直执行一次
  SearchResultViewModel _resultViewModel;
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SearchViewModel>(
      model: SearchViewModel(),
      onReadyMore: (model) {
        _resultViewModel = SearchResultViewModel();
        model.getSearchHotKey();
      },
      builder: (context, model, _) {
        return Scaffold(
          appBar: _buildSearchUI(model),
          body:Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 10.h),
                  _buildHotSearchUIList(model),
                  _buildSearchHistoryUIList(model)
                ],
              ),
              model.isReady?SearchResultPage(queryKey,resultViewModel: _resultViewModel,):Container()
            ],
          )
        );
      },
    );
  }

  ///顶部搜索框
  Widget _buildSearchUI(SearchViewModel model){
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
                      queryHint: model.hotKeyList.isEmpty ? "搜索文章"
                          : "${model.hotKeyList[0].name} | ${model.hotKeyList[1].name}",
                      enabled: true,
                      suffixIcon:Icons.cancel,
                      textEditingController: _textEditingController,
                      onPressed: (){
                        model.readySearch(false);
                        _textEditingController.clear();
                      },
                      changed: (value){
                        if(value.isEmpty){
                          model.readySearch(false);
                        }
                      },
                      submit: (value){
                        queryKey = value;
                        if(model.isReady){
                          _resultViewModel.initalSearchArticle(queryKey);
                        }else{
                          model.readySearch(true);
                        }
                      },
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
                TextButton(
                  child: Text("取消", style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            )));
  }
  ///热门搜索
  Widget _buildHotSearchUIList(SearchViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 10.w),
      child:ChipSearchList(
        model: model,
        title: "热门搜索",
        onTap:(value){
          //点击了某一项进行搜索
          _textEditingController.text=value;
          queryKey = value;
          model.readySearch(true);
        }
      )
    );
  }

  ///搜索历史
  Widget _buildSearchHistoryUIList(SearchViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 5.w,
          horizontal: 10.h),
      child: ChipSearchList(
        model: model,
        title: "历史记录",
      )
    );
  }
}

class ChipSearchList extends StatelessWidget {
  final SearchViewModel model;
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


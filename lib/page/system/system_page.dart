
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/system/system_controller.dart';
import 'package:wan_android/route/routes_page.dart';


class SystemPage extends StatefulWidget {
  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> with AutomaticKeepAliveClientMixin{
  var _systemController = Get.put<SystemController>(SystemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("体系"),
        elevation: 0.0,
      ),
      body:GetX<SystemController>(
        initState: (_){
          _systemController.getSystemData();
        },
        builder: (_){
          if(_systemController.loadState.value==LoadState.LOADING){
            return LoadingPage();
          }
          if (_systemController.loadState.value == LoadState.EMPTY) {
            return EmptyPage();
          } else if (_systemController.loadState.value == LoadState.FAILURE) {
            return NetWorkErrorPage(onPressed: (){
              _systemController.getSystemData();
            },);
          }
          return _buildBodyContent();
        },
      )
    );
  }

  Widget _buildBodyContent(){
    return ListView.builder(
      itemBuilder: (context,index){
        return StickyHeader(
          header: _buildStickyHeader(index),
          content: _buildStickyContent(index)
        );
      },
      itemCount: _systemController.tipItems.length,
    );
  }

  _buildStickyHeader(int index){
    return PhysicalModel(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
        decoration: BoxDecoration(
            color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.h,color: Colors.grey[200].withOpacity(0.5))
          )
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          _systemController.tipItems[index].name,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _buildStickyContent(int index){
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Wrap(
        spacing: 15.0.w,
        runSpacing: 10.0.h,
        children: _systemController.tipItems[index].children.map((e) {
          return ActionChip(
            label: Text(e.name),
            elevation: 5.0,
            backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            onPressed: () {
              //点击选项
              Get.toNamed(RoutesConfig.SYSTEM_CONTENT, arguments: {
                SystemConstant.SELECT_TITLE_INDEX:_systemController.tipItems[index].children.indexOf(e),
                SystemConstant.SELECT_TITLE:_systemController.tipItems[index]
              });
            },
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          );
        }).toList(),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}



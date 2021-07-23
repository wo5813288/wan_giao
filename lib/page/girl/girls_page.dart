

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/girl/girl_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GirlsPage extends GetView<GirlController> {
  const GirlsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("美女福利"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Obx(()=>controller.isList.value?Icon(Icons.view_module):Icon(Icons.menu)),
            onPressed: (){
              controller.isList.value = !controller.isList.value;
            },
          )
        ],
      ),
      body: Container(
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent(){
    return Obx((){
      return StatePageWithViewController<GirlController>(
        model: controller,
        onLoading: () async{
          controller.getGirls(false);
        },
        onRefresh: () async{
          controller.refresh();
        },
        onPressed: (){
          controller.initData(true);
        },
        controller: controller.refreshController,
        child: controller.isList.value?
            ListView.builder(
              itemBuilder: (context,index){
                return  Card(
                  child:CachedNetworkImage(
                    imageUrl:controller.girls[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5,
                );
              },
              itemCount: controller.girls.length,
            )
            :StaggeredGridView.countBuilder(
          itemCount: controller.girls.length,
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(2, index.isEven?2:2.5);
          },
          crossAxisCount: 4,
          itemBuilder: (context,index){
            var girl =controller.girls[index];
            return Card(
              child:CachedNetworkImage(
                imageUrl:girl.imageUrl,
                fit: BoxFit.cover,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5,
            );
          },
        ),
      );
    });
  }
}

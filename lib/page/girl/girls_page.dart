import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/girl/girl_controller.dart';
import 'package:wan_android/page/girl/girl_detail_page.dart';
import 'package:wan_android/route/routes_page.dart';

class GirlPage extends GetView<GirlController> {
  const GirlPage({Key key}) : super(key: key);

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
        child: controller.isList.value ?_buildListUI():_buildStaggeredGridUI()
      );
    });
  }

  ///ListView.builder中itemBuilder需要指定组件高度，否则在回滚时会出现回滚多次倒是页面闪动混乱
  Widget _buildListUI() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            child: Image.network(
              controller.girls[index].imageUrl,
              fit: BoxFit.cover,
              height: 200.h,
            ),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
          ),
          onTap: (){
            Get.to(()=>GirlDetailPage(imageUrl:controller.girls[index].imageUrl));
          },
        );
      },
      itemCount: controller.girls.length,
      shrinkWrap: true,
    );
  }

  Widget _buildStaggeredGridUI(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: controller.girls.length,
      itemBuilder: (context,index){
        var girl = controller.girls[index];
        return InkWell(
          child: Hero(
            tag: girl.imageUrl,
            child: Card(
              child: CachedNetworkImage(
                imageUrl:girl.imageUrl,
                fit: BoxFit.cover,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5,
            ),
          ),
          onTap: (){
            Get.to(()=>GirlDetailPage(imageUrl: girl.imageUrl));
          },
        );
      },
    );
  }
}




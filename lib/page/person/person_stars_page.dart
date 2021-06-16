
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/coin_sign_data.dart';
import 'package:wan_android/controller/person_stars_controller.dart';
import 'file:///D:/androidwork/wan_android_flutter/lib/compents/state_page.dart';

///个人积分
class PersonStartsPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text(
          "积分列表"
        ),
      ),
      body: GetX<PersonStarsController>(
        initState: (_){
          Get.find<PersonStarsController>().initData(true);
        },
        builder: (controller){
          return _buildContentUI(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.vertical_align_top),
        onPressed: (){
          //滑动到最顶部
          _scrollController.animateTo(0.0, duration: Duration(milliseconds: 500), curve: Curves.linear);
        },
      ),
    );
  }

  Widget _buildContentUI(PersonStarsController model){
    return StatePageWithViewController<PersonStarsController>(
      model: model,
      controller: model.refreshController,
      onPressed: () async{
        model.initData(true);
      },
      onLoading: () async{
        model.getPersonStarts(false);
      },
      onRefresh: (){
        model.refresh();
      },
      child: ListView.separated(
        controller: _scrollController,
        itemCount: model.coinSigItems.length,
        itemBuilder: (context,index){
          CoinSignItem item = model.coinSigItems[index];
          return ListTile(
            title: Text(item.desc,style: TextStyle(color: Theme.of(context).textTheme.headline3.color)),
          );
        },
        separatorBuilder: (context,index){
          return Divider(thickness: 1,color: Colors.grey);
        },
      ),
    );
  }
}

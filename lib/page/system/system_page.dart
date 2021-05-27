
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/tip_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/viewmodel/system_view_model.dart';

class SystemPage extends StatefulWidget {
  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("体系"),
        elevation: 0.0,
      ),
      body:ProviderWidget<SystemViewModel>(
        model: SystemViewModel(),
        onReadyMore: (model){
          model.getSystemData();
        },
        builder: (context,model,_){
          if(model.loadState==LoadState.LOADING){
            return LoadingPage();
          }
          if (model.loadState == LoadState.EMPTY) {
            return EmptyPage();
          } else if (model.loadState == LoadState.FAILURE) {
            return NetWorkErrorPage(onPressed: (){
              model.getSystemData();
            },);
          }
          return ListView.separated(
            itemCount: model.tipItems.length,
            itemBuilder: (context,index){
              return _buildTipItemUI(model.tipItems[index]);
            },
            separatorBuilder: (context,index){
              return Divider(thickness: 10.0,color: Colors.white,);
            },
          );
        },
      )
    );
  }

  Widget _buildTipItemUI(TipItem tipItem){
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100].withOpacity(0.5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tipItem.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          _buildTipItemChildrenUI(tipItem),
        ],
      ),
    );
  }

  Widget _buildTipItemChildrenUI(TipItem tipItem) {
    List<Widget> _childs = [];
    for(int i=0;i<tipItem.children.length;i++){
      TipItemChildren children = tipItem.children[i];
      var chip =ActionChip(
        label: Text(children.name),
        elevation: 5.0,
        backgroundColor: Colors.transparent,
        onPressed: (){
          //点击选项
          Get.toNamed(
            RoutesConfig.SYSTEM_CONTENT,
            arguments: {
              SystemConstant.SELECT_TITLE_INDEX:i,
              SystemConstant.SELECT_TITLE:tipItem
            }
          );
        },
        labelStyle: TextStyle(
          color: Colors.red,
        ),
      );
      _childs.add(chip);
    }
    return Wrap(
      spacing: 15.0,
      runSpacing: 10.0,
      children: _childs,
      /*children: tipItem.children.map((e){
        return ActionChip(
          label: Text(e.name),
          elevation: 5.0,
          backgroundColor: Colors.transparent,
          onPressed: (){
            //点击选项
            Fluttertoast.showToast(msg: e.name);
          },
          labelStyle: TextStyle(
            color: Colors.red,
          ),
        );
      }).toList()*/
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}



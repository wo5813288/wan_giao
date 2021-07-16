
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/tip_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/controller/system/system_controller.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/compents/state_page.dart';
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
          return ListView.separated(
            itemCount: _systemController.tipItems.length,
            itemBuilder: (context,index){
              return _buildTipItemUI(_systemController.tipItems[index]);
            },
            separatorBuilder: (context,index){
              return Divider(thickness: 10.0,);
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}



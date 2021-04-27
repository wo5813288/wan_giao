
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wan_android/bean/tip_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/model/system_model.dart';

class SystemPage extends StatefulWidget {
  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> with AutomaticKeepAliveClientMixin{
  var _tipItems =[];
  @override
  void initState() {
    super.initState();
    SystemModel.getWehChatData()
    .then((value){
      setState(() {
        _tipItems = value;
      });
    }).onError<ResultException>((error, stackTrace){
      debugPrint("===体系请求错误${error.message}");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("体系"),
        elevation: 0.0,
      ),
      body:ListView.separated(
        itemCount: _tipItems.length,
        itemBuilder: (context,index){
          return _buildTipItemUI(_tipItems[index]);
        },
        separatorBuilder: (context,index){
          return Divider(thickness: 10.0,color: Colors.white,);
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
          _buildTipItemChildrenUI(tipItem.children),
        ],
      ),
    );
  }

  Widget _buildTipItemChildrenUI(List<TipItemChildren> tipItemChildrens) {
    return Wrap(
      spacing: 15.0,
      runSpacing: 10.0,
      children: tipItemChildrens.map((e){
        return ActionChip(
          label: Text(e.name),
          elevation: 5.0,
          backgroundColor: Colors.transparent,
          onPressed: (){
            Fluttertoast.showToast(msg: e.name);
          },
          labelStyle: TextStyle(
            color: Colors.red,
          ),
        );
      }).toList()
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}



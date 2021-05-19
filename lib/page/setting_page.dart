
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/util/event_bus_util.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text(
            "设置",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:Consumer<UserViewModel>(
        builder: (context,model,_){
          return Container(
            margin: EdgeInsets.only(top: ScreenUtil.getInstance().getAdapterSize(10)),
            width: double.infinity,
            height: ScreenUtil.getInstance().getAdapterSize(50.0),
            color: Colors.white,
            child: TextButton(
              child: Text(
                "退出登录",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: ScreenUtil.getInstance().getSp(16)
                ),
              ),
              onPressed:()async{
                await HttpManager.clearCookie();
                await SpUtil.clear();
                model.setLoginState(false);
                //通知用户的登录状态发生变化
                EventBusUtil.send(UserEvent(true));
                Get.back();
              },
            ),
          );
        },
      )
    );
  }
}

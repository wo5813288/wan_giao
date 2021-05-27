
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/util/event_bus_util.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';
import 'package:wan_android/viewmodel/theme_view_model.dart';

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
      body:Container(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            _switchThemeDark(),
            SizedBox(height: 10.h),
            //退出登录
            _logoutButton()
          ],
        ),
      )
    );
  }

  Widget _switchThemeDark(){
    return Container(
      child:  Consumer<CurThemeData>(
        builder: (context,model,_){
          return SwitchListTile(
            activeTrackColor: Colors.lightGreen,
            value: model.isThemeDark,
            title: Text("夜间模式"),
            onChanged: (flag){
              model.setThemeDark(flag);
            },
          );
        },
      ),
      color: Colors.white,
    );
  }

  Widget _logoutButton(){
    return Consumer<UserViewModel>(
      builder: (context,model,_){
        return Container(
          margin: EdgeInsets.only(top:10.h),
          width: double.infinity,
          height: 50.h,
          color: Colors.white,
          child: TextButton(
            child: Text(
              "退出登录",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.sp
              ),
            ),
            onPressed:()async{
              await HttpManager.clearCookie();
              await SpUtil.clear();
              model.setLoginState(false);
              //通知用户的登录状态发生变化
              EventBusUtil.send(UserEvent(false));
              Get.back();
            },
          ),
        );
      },
    );
  }
}

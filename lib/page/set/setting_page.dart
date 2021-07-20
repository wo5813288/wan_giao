
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/controller/device_info_controller.dart';
import 'package:wan_android/controller/theme_controller.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/theme/app_theme.dart';

class SettingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: SpUtil.getString(ThemeKey.KEY_APP_THEME)==ThemeKey.LIGHT?Colors.black:Colors.grey
        ),
        title: Text(
            "设置",
          style: TextStyle(
            color: SpUtil.getString(ThemeKey.KEY_APP_THEME)==ThemeKey.LIGHT?Colors.black:Colors.grey
          ),
        ),
        centerTitle: true,
        backgroundColor: SpUtil.getString(ThemeKey.KEY_APP_THEME)==ThemeKey.LIGHT?Colors.white:Colors.black,
      ),
      body:Container(
        padding: EdgeInsets.only(top: 10.h),
        color: SpUtil.getString(ThemeKey.KEY_APP_THEME)==ThemeKey.LIGHT?Colors.grey[200].withOpacity(0.7):Colors.black45,
        child: Column(
          children: [
            _switchThemeDark(context),
            SizedBox(height: 10.h),
            _appVersionText(context),
            SizedBox(height: 10.h),
            _appAuthorText(context),
            //退出登录
            _logoutButton(context),
            SizedBox(height: 10.h),

          ],
        ),
      )
    );
  }

  Widget _switchThemeDark(BuildContext context){
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Obx((){
        return SwitchListTile(
          dense: true,
          value: Get.find<ThemeController>().themKey==ThemeKey.DARK,
          title: Text("夜间模式",style:  Theme.of(context).textTheme.bodyText1,),
          onChanged: (flag){
            Get.find<ThemeController>().setThemeData(flag?ThemeKey.DARK:ThemeKey.LIGHT);
          },
        );
      }),
    );
  }

  Widget _appVersionText(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListTile(
        title: Text("检查版本",
            style: Theme.of(context).textTheme.bodyText1),
        dense: true,
        trailing: Obx((){
          return Text(
              Get.find<DeviceInfoController>().versionName.value,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontSize: 15.sp
              )
          );
        }),
      ),
    );
  }

  Widget _appAuthorText(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          ListTile(
            title: Text("作者",
                style: Theme.of(context).textTheme.bodyText1),
            dense: true,
            trailing: Obx((){
              return Text(
                  "Lollipop",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 15.sp
                  )
              );
            }),
          ),
          Divider(thickness: 1.h),
          ListTile(
            title: Text("邮箱",
                style: Theme.of(context).textTheme.bodyText1),
            dense: true,
            trailing: Obx((){
              return Text(
                  "ljs581@163.com",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 15.sp
                  )
              );
            }),
          ),
          Divider(thickness: 1.h),
          ListTile(
            title: Text("Gitee",
                style: Theme.of(context).textTheme.bodyText1),
            dense: true,
            trailing: Obx((){
              return Text(
                  "gitee.com/lambadaace/wan_android",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 15.sp
                  )
              );
            }),
          ),
          Divider(thickness: 1.h),
          ListTile(
            title: Text("GitHub",
                style: Theme.of(context).textTheme.bodyText1),
            dense: true,
            trailing: Obx((){
              return Text(
                  "github.com/wo5813288/wan_giao",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 15.sp
                  )
              );
            }),
          ),
        ],
      )
    );
  }

  Widget _logoutButton(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top:10.h),
      width: double.infinity,
      height: 40.h,
      color: Theme.of(context).scaffoldBackgroundColor,
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
          Get.find<AppState>().loginState.value = LoginState.LOGO_OUT;
          Get.back();
        },
      ),
    );
  }
}

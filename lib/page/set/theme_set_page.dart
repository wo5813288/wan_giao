import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/compents/constant.dart';
import 'package:wan_android/theme/app_theme.dart';

class ThemeSetPage extends StatefulWidget {
  const ThemeSetPage({Key key}) : super(key: key);

  @override
  _ThemeSetPageState createState() => _ThemeSetPageState();
}

class _ThemeSetPageState extends State<ThemeSetPage> {
  final List _themeTitles = ["跟随系统", "开启", "关闭"];

  @override
  Widget build(BuildContext context) {
    String theme = SpUtil.getString(Constant.KEY_APP_THEME);
    String themeMode;
    switch (theme) {
      case ThemeKey.LIGHT:
        themeMode = _themeTitles[2];
        break;
      case ThemeKey.DARK:
        themeMode = _themeTitles[1];
        break;
      case ThemeKey.SYSTEM:
        themeMode = _themeTitles[0];
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("夜间模式",
            style: TextStyle(
              color: Get.isDarkMode ? Colors.grey : Colors.black,
            )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Get.isDarkMode ? Colors.grey : Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                 String themeKey;
                  if(index==0){
                    themeKey = ThemeKey.SYSTEM;
                    Get.changeThemeMode(ThemeMode.system);
                  }else if(index==1){
                     themeKey = ThemeKey.DARK;
                    Get.changeThemeMode(ThemeMode.dark);
                  }else{
                     themeKey = ThemeKey.LIGHT;
                    Get.changeThemeMode(ThemeMode.light);
                  }
                  SpUtil.putString(Constant.KEY_APP_THEME, themeKey);
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _themeTitles[index],
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      themeMode == _themeTitles[index]
                          ? Icon(
                              Icons.done,
                              color: Colors.blue,
                            )
                          : Text("")
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: _themeTitles.length),
      ),
    );
  }
}

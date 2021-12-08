import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/compents/constant.dart';
import 'package:wan_android/theme/app_color.dart';

///白天模式
ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: IconThemeData(
    color: KColors.kIconLightColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    elevation: 0.0,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
    subtitle1: TextStyle(color: Colors.grey),
    headline3: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
    bodyText1: TextStyle(color: Colors.black),
  ),
  dividerTheme: DividerThemeData(color: KColors.line),
);

///夜间模式
ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0.0,
  ),
  scaffoldBackgroundColor: Colors.black,
  iconTheme: IconThemeData(color: KColors.kIconDarkColor),
  textTheme: TextTheme(
    headline1: TextStyle(
        color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        fontSize: 17, color: Colors.grey, fontWeight: FontWeight.bold),
    headline3: TextStyle(color: Colors.grey),
    subtitle1: TextStyle(color: Colors.grey),
    bodyText2: TextStyle(color: Colors.grey),
    bodyText1: TextStyle(color: Colors.grey),
  ),
  dividerTheme: DividerThemeData(color: KColors.darkLine),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    selectedIconTheme: IconThemeData(color: Colors.white),
    selectedItemColor: Colors.white,
  ),
);

IconThemeData lightIconTheme = IconThemeData(color: Colors.grey);
IconThemeData darkIconTheme = IconThemeData(color: Colors.grey);

class ThemeKey {
  ThemeKey._();

  static const String DARK = "dark";
  static const String LIGHT = "light";
  static const String SYSTEM = "system";
}

//主题列表
Map<String, ThemeData> themeList = {
  ThemeKey.DARK: darkTheme,
  ThemeKey.LIGHT: lightTheme
};

///获取用户保存的主题
ThemeData getThemeData(){
  String key = SpUtil.getString(Constant.KEY_APP_THEME);
  if(key.isEmpty||key==ThemeKey.SYSTEM) return lightTheme;
  return themeList[key];
}

///获取用户夜间模式的选项
ThemeMode getThemeMode(){
  String key = SpUtil.getString(Constant.KEY_APP_THEME);
  switch(key){
    case ThemeKey.LIGHT:
      return ThemeMode.light;
    case ThemeKey.DARK:
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}

///获取对用主题的选择
String getCurThemeTitle(){
  String key = SpUtil.getString(Constant.KEY_APP_THEME);
  String themeMode;
  switch(key) {
    case ThemeKey.DARK:
      themeMode = '开启';
      break;
    case ThemeKey.LIGHT:
      themeMode = '关闭';
      break;
    default:
      themeMode = '跟随系统';
      break;
  }
  return themeMode;
}
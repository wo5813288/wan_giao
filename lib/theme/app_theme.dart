import 'package:flutter/material.dart';
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

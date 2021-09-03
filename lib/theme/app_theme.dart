import 'package:flutter/material.dart';
import 'package:wan_android/theme/app_color.dart';

///白天模式
ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    splashColor: Colors.white12,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.grey[200].withOpacity(0.7),
    iconTheme: IconThemeData(color: KColors.kIconLightColor),
    textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.black,
        ),
        subtitle1: TextStyle(color: Colors.grey),
        headline3: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black)));

///夜间模式
ThemeData darkTheme = ThemeData.dark().copyWith(
    iconTheme: IconThemeData(color: KColors.kIconDarkColor));

IconThemeData lightIconTheme = IconThemeData(color: Colors.grey);
IconThemeData darkIconTheme = IconThemeData(color: Colors.grey);




class ThemeKey {
  ThemeKey._();

  static const String KEY_APP_THEME = "app_theme";
  static const String DARK = "dark";
  static const String LIGHT = "light";
}

//主题列表
Map<String, ThemeData> themeList = {
  ThemeKey.DARK: darkTheme,
  ThemeKey.LIGHT: lightTheme
};

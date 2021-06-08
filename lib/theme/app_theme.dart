
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    primaryColor:Colors.blue,
    splashColor: Colors.white12,
    highlightColor: Colors.grey[200].withOpacity(0.7),
    accentColor: Colors.white);

ThemeData darkTheme = ThemeData(
    primaryColor:Colors.black,
    splashColor: Colors.white12,
    highlightColor: Colors.grey[200].withOpacity(0.7),
    accentColor: Colors.black);

IconThemeData lightIconTheme = IconThemeData(
    color:Colors.grey
);
IconThemeData darkIconTheme = IconThemeData(
    color:Colors.grey
);

class ThemeKey {
  ThemeKey._();
  static const String KEY_APP_THEME="app_theme";
  static const String DARK = "dark";
  static const String LIGHT = "light";
}


//主题列表
Map<String,ThemeData> themeList = {
  ThemeKey.DARK:darkTheme,
  ThemeKey.LIGHT:lightTheme
};
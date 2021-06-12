
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor:Colors.blue,
    splashColor: Colors.white12,
    highlightColor: Colors.grey[200].withOpacity(0.7),
    accentColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        color: Colors.black
      )

    )
);
/*ThemeData lightTheme = ThemeData(
    primaryColor:Colors.blue,
    splashColor: Colors.white12,
    highlightColor: Colors.grey[200].withOpacity(0.7),
    accentColor: Colors.white,
    scaffoldBackgroundColor: Colors.white
);*/

ThemeData darkTheme = ThemeData.dark();

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

// 输入框边框
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputBorder kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    width: 1,
    color: Colors.grey,
  ),
);

TextStyle kTextLoadingStyle = TextStyle(
  fontSize: 15.sp,
  color: Colors.black
);

TextStyle kSearchHintTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(15),
  color: Colors.grey
);




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


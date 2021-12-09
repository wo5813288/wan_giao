// 输入框边框
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputBorder kLoginInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(50.w),
  borderSide: BorderSide(
    width: 1,
    color: Colors.grey,
  ),
);

TextStyle kTextLoadingStyle = TextStyle(fontSize: 15.sp, color: Colors.black);

TextStyle kTextLoginInputStyle =
    TextStyle(fontSize: 15.sp, color: Colors.black);

TextStyle kSearchHintTextStyle = TextStyle(fontSize: 15.sp, color: Colors.grey);

//隐私协议按钮
TextStyle kPrivacyYesTextStyle = TextStyle(fontSize: 16.sp, color: Colors.blue);

TextStyle kPrivacyNoTextStyle = TextStyle(fontSize: 16.sp, color: Colors.grey);

///导航栏透明并且状态栏字体颜色为白色
SystemUiOverlayStyle lightSystemUiStyle = SystemUiOverlayStyle.light.copyWith(
  systemNavigationBarColor: Colors.transparent,
);

///导航栏透明并且状态栏字体颜色为黑色
SystemUiOverlayStyle darkSystemUiStyle = SystemUiOverlayStyle.dark.copyWith(
  systemNavigationBarColor: Colors.transparent,
);

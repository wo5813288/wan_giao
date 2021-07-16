
import 'package:flutter/material.dart';




class KColors{
  KColors._();
  static const searchBackgroundColor = Color(0xFFF5F5F5);
  // 背景颜色
  static const Color kBgColor = Color(0xFFFEDCE0);
// 文字颜色
  static const Color kTextColor = Color(0xFF3D0007);
// 按钮开始颜色
  static const Color kBtnColorStart = Color(0xFFFA6B74);
// 按钮结束颜色
  static const Color kBtnColorEnd = Color(0xFFF89500);
// 按钮投影颜色
  static const Color kBtnShadowColor = Color(0x33D83131);
// 输入框边框颜色
  static const Color kInputBorderColor = Color(0xFFECECEC);
  static const Color kIconLightColor = Colors.blue;
  static const Color kIconDarkColor = Colors.greenAccent;
  static const Color kMessageBgLightColor = kInputBorderColor;
  static const Color kMessageBgDarkColor = Colors.grey;
}


// 按钮渐变背景色
const LinearGradient kBtnLinearGradient = LinearGradient(
  colors: [
    KColors.kBtnColorStart,
    KColors.kBtnColorEnd,
  ],
);

const LinearGradient kLeaderboardGradient = LinearGradient(
  colors: [

  ]
);
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/viewmodel/base_view_model.dart';
import 'package:wan_android/compents/contrants_info.dart';

///App主题切换
class CurThemeData extends BaseViewModel {
  bool _isThemeDark;

  bool get isThemeDark => _isThemeDark;

  CurThemeData(){
    _isThemeDark = SpUtil.getBool(ConstantInfo.THEME_DARK,defValue: false);
    _themeColor = _isThemeDark?Colors.black:Colors.blue;
  }
  ///设置是否夜间模式
  void setThemeDark(bool dark) {
    _isThemeDark = dark;
    SpUtil.putBool(ConstantInfo.THEME_DARK, dark);
    setThemeColor(dark?Colors.black:Colors.blue);
    notifyListeners();
  }

  Color _themeColor;

  Color get themColor=>_themeColor;

  void setThemeColor(Color color){
    _themeColor = color;
    notifyListeners();
  }
}

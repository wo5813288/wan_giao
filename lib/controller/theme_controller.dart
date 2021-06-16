
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/theme/app_theme.dart';

class ThemeController extends GetxController{

  var _themKeyObs ="".obs;

  String get themKey =>_themKeyObs.value;

  ///保存当前选择到主题
  void setThemeData(String themKey) async {
    debugPrint("===主题$themKey====");
    Get.changeTheme(themeList[themKey]);
    _themKeyObs.value = themKey;
    await SpUtil.putString(ThemeKey.KEY_APP_THEME,themKey);
  }

}
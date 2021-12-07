
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/bean/user_data.dart';
import 'package:wan_android/compents/dialog_util.dart';
import 'package:wan_android/controller/base/base_getx_controller.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/theme/app_text.dart';

class LoginController extends BaseGetXController{

  ///提交登录
  void submitForm(String userName,String password) {
    if(userName.isEmpty||password.isEmpty){
      showToast("用户名或密码不能为空",position: ToastPosition.bottom);
      return;
    }

    LoadingDialog.show(message: KText.loginingText);
    //提交登录请求
    handleRequest(
        HttpManager.instance.postFormData("user/login", {"username": userName.trim(), "password": password.trim()}),
        true, (value) {
      var user = UserData.fromJson(value).data;
      //登录成功，记录账号和密码
      //user.setUserPassword(userPwdController.text.trim());
      Global.saveUserProfile(user);
      //通知各个页面用户登录了
      appState.setIsLogin(LoginState.LOGIN);
      LoadingDialog.dismiss();
      //返回上一级页面，并返回一个结果
      Get.back();
    }, failure: (error) {
      LoadingDialog.dismiss();
      Get.snackbar("错误", error,backgroundColor: Colors.red,colorText: Colors.white);
    });
  }

}
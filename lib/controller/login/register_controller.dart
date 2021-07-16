
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/bean/user_data.dart';
import 'package:wan_android/compents/dialog_util.dart';
import 'package:wan_android/controller/base/base_getx_controller.dart';
import 'package:get/get.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/theme/app_text.dart';
class RegisterController extends  BaseGetXController{
  var autovalidateMode = AutovalidateMode.disabled.obs;
  var isObscure = true.obs;
  var isShowClearIcon = false.obs;
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPwdController = TextEditingController();
  TextEditingController userRePwdController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    userNameController.addListener(() {
      isShowClearIcon.value = userNameController.text.isNotEmpty;
    });
  }

  void clearText(){
    userNameController.text = "";
  }
  ///设置当前密码是否可见，false可见，true不可见
  void setObscure(bool obscure) {
    isObscure.value = obscure;
  }

  ///设置当前自动验证模式
  void setAutovalidateMode(AutovalidateMode mode){
    autovalidateMode.value = mode;
  }

  ///提交登录
  void submitForm() {
    LoadingDialog.show(message: KText.loginingText);
    //提交登录请求
    handleRequest(
        HttpManager.instance.postFormData(
            "user/register",
            {
              "username": userNameController.text.trim(),
              "password": userPwdController.text.trim(),
              "repassword":userRePwdController.text.trim()
            }),
        true, (value) {
      var user = UserData.fromJson(value).data;
      //登录成功，记录账号和密码
      user.setUserPassword(userPwdController.text.trim());
      Global.saveUserProfile(user);
      Get.find<AppState>().loginState.value = LoginState.LOGIN;
      List<Cookie> cookies = [
        Cookie('loginUserName', userNameController.text.trim()),
        Cookie('loginUserPassword', userPwdController.text.trim())
      ];
      HttpManager.instance.addCookies(cookies);
      LoadingDialog.dismiss();
      //返回上一级页面，并返回一个结果
      Get.offAllNamed(RoutesConfig.MAIN);
    }, failure: (error) {
      LoadingDialog.dismiss();
      Get.snackbar("错误", error,backgroundColor: Colors.red,colorText: Colors.white);
    });
  }
}
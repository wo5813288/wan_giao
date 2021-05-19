import 'dart:io';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wan_android/base_view_model.dart';
import 'package:wan_android/bean/coin_data.dart';
import 'package:wan_android/bean/user_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/util/event_bus_util.dart';

class PersonViewModel extends BaseViewModel {
  Coin _coin;

  Coin get coin => _coin;

  //设置积分数据
  void setCoin(Coin c) {
    _coin = c;
    notifyListeners();
  }

  ///获取积分列表和排名
  void getUserCoin() {
    handleRequest(HttpManager.instance.get("lg/coin/userinfo/json"), false,
        (value) {
      Coin coin = CoinData.fromJson(value).data;
      setCoin(coin);
    });
  }
}

class UserViewModel extends BaseViewModel {
  bool _isLogin = false;

  //是否已经登录
  bool get isLogin => _isLogin;

  ///更改登录状态
  void setLoginState(bool login) {
    _isLogin = login;
    notifyListeners();
  }

  ///收藏文章
  void collectionArticle(String id, success(), failure(String value)) {
    handleRequest(HttpManager.instance.post("lg/collect/$id/json"), false,
        (value) {
      success();
    }, failure: (error) {
      failure(error);
    });
  }

  ///取消收藏文章
  void unCollectionArticle(String id, success(), failure(String value)) {
    handleRequest(
        HttpManager.instance.post("lg/uncollect_originId/$id/json"), false,
        (value) {
      success();
    }, failure: (error) {
      failure(error);
    });
  }
}

class LoginUserModel extends BaseViewModel {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPwdController = TextEditingController();
  String _userName = "";

  String get userName => _userName;

  String _userPwd = "";

  String get userPwd => _userPwd;
  bool _isObscure = true;

  bool get isObscure => _isObscure;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  TextEditingController get userNameController => _userNameController;

  TextEditingController get userPwdController => _userPwdController;

  void setObscure(bool obscure) {
    _isObscure = obscure;
    notifyListeners();
  }

  void setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void setUserPwd(String userPwd) {
    _userPwd = userPwd;
    notifyListeners();
  }

  void clearText() {
    setUserName("");
    _userNameController.text = "";
  }

  ///验证用户是否为空
  String validateUserName(value) {
    if (value.isEmpty) {
      return "用户名不能为空";
    }
    return null;
  }

  ///验证密码规则
  String validateUserPwd(value) {
    if (value.isEmpty) {
      return "密码不能为空";
    } else if (value.length < 6) {
      return "密码不能少于六位";
    }
    return null;
  }

  ///提交登录
  void submitForm(GlobalKey<FormState> globalKey) {
    if (globalKey.currentState.validate()) {
      globalKey.currentState.save();
      //提交登录请求
      handleRequest(
          HttpManager.instance.postFormData(
              "user/login", {"username": _userName, "password": _userPwd}),
          true, (value) {
        var user = UserData.fromJson(value).data;
        //登录成功，记录账号和密码
        //SpUtil.putString(ConstantInfo.KEY_USER_NAME, user.username);
        SpUtil.putString(ConstantInfo.KEY_USER_PWD, _userPwd);
        SpUtil.putObject(ConstantInfo.KEY_USER, user);
        List<Cookie> cookies = [
          Cookie('loginUserName', _userName),
          Cookie('loginUserPassword', _userPwd)
        ];
        HttpManager.instance.addCookies(cookies);
        EventBusUtil.send(UserEvent(true));
        //返回上一级页面，并返回一个结果
        Get.back(result: true);
      }, failure: (error) {
        Fluttertoast.showToast(
            msg: error,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red);
      });
    } else {
      _autovalidateMode = AutovalidateMode.always;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userNameController.dispose();
    _userPwdController.dispose();
  }
}

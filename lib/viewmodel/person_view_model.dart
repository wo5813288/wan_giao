import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wan_android/base_view_model.dart';
import 'package:wan_android/http/http_manager.dart';

class PersonViewModel extends BaseViewModel {}

class UserViewModel extends BaseViewModel {}

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
     if(globalKey.currentState.validate()){
      globalKey.currentState.save();
      //提交登录请求
      handleRequest(HttpManager.instance.postFormData("user/login", {"username":_userName,"password":_userPwd}), true,
              (value){

              },failure: (error){
            Fluttertoast.showToast(msg: error,gravity:ToastGravity.CENTER,backgroundColor: Colors.red);
          });
    }else{
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

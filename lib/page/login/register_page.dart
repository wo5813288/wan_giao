
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_android/compents/login_widget.dart';
import 'package:wan_android/controller/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:wan_android/controller/login/register_controller.dart';
import 'package:wan_android/theme/app_text.dart';
class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Stack(
        //返回按钮
        children: [
          Image.asset("assets/images/bg_login_header.png",fit: BoxFit.cover,width: double.infinity),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 250.h),
                ClipPath(
                    clipper: LoginClipper(),
                    child: RegisterBodyWidget()
                )
              ],
            ),
          ),
          Positioned(
            top: ScreenUtil().statusBarHeight,
            left: 10.w,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios,size: 20.w,color: Colors.white,),
              onPressed: (){
                Get.back();
              },
            ),
          )
        ],
      ),
    );
  }
}

class RegisterBodyWidget extends StatelessWidget {
  final _loginKeyState = GlobalKey<FormState>();
  var registerController = Get.find<RegisterController>();
  ///验证用户是否为空
  String _validateUserName(value) {
    if (value.isEmpty) {
      return "用户名不能为空";
    }
    return null;
  }

  ///验证密码规则
  String _validateUserPwd(value) {
    if (value.isEmpty) {
      return "密码不能为空";
    } else if (value.length < 6) {
      return "密码不能少于六位";
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.only(top: 50.h,left: 20.w,right:20.w),
        child: Form(
          key: _loginKeyState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 4),
              Obx((){
                return LoginInput(
                  hintText: "用户名",
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: registerController.isShowClearIcon.value?IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: (){
                      registerController.clearText();
                    },
                  ):null,
                  autovalidateMode: registerController.autovalidateMode.value,
                  validator: _validateUserName,
                  textEditingController: registerController.userNameController,
                );
              }),
              SizedBox(height: 16),
              Obx((){
                return LoginInput(
                  hintText: "密码",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(registerController.isObscure.value?Icons.visibility_off:Icons.visibility),
                    onPressed: (){
                      registerController.setObscure(!registerController.isObscure.value);
                    },
                  ),
                  textEditingController: registerController.userPwdController,
                  obscureText: registerController.isObscure.value,
                  autovalidateMode: registerController.autovalidateMode.value,
                  validator: _validateUserPwd,
                );
              }),
              SizedBox(height: 16),
              Obx((){
                return LoginInput(
                  hintText: "确认密码",
                  prefixIcon: Icon(Icons.lock),
                  textEditingController: registerController.userRePwdController,
                  obscureText: registerController.isObscure.value,
                  autovalidateMode: registerController.autovalidateMode.value,
                  validator: _validateUserPwd,
                );
              }),
              SizedBox(height: 30.h),
              LoginButton(
                loginText: KText.registerText,
                onTap: (){
                  if(!_loginKeyState.currentState.validate()){
                    registerController.setAutovalidateMode(AutovalidateMode.always);
                    return;
                  }
                  //提交登录请求
                  registerController.submitForm();
                },
              ),
            ],
          ),
        )
    );
  }
}

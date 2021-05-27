import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wan_android/compents/dialog_util.dart';
import 'package:wan_android/compents/login_widget.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/theme/app_text.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginKeyState = GlobalKey<FormState>();

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
                    child: LoginBodyWidget(key: loginKeyState)
                )
              ],
            ),
          ),
          Positioned(
            top: ScreenUtil().statusBarHeight,
            left: 10.w,
            child: IconButton(
              icon: Icon(Icons.close,size: 20.w),
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

class LoginBodyWidget extends StatefulWidget {
  LoginBodyWidget({Key key}):super(key:key);
  @override
  _LoginBodyWidgetState createState() => _LoginBodyWidgetState();
}

/// 登录页面内容体
class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  final loginKeyState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.only(top: 50.h,left: 20.w,right:20.w),
      child: ProviderWidget<LoginUserModel>(
        model: LoginUserModel(),
        builder: (context,model,_){
          return Form(
            key: loginKeyState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 4),
                LoginInput(
                  hintText: "用户名",
                  prefixIcon: Icon(Icons.person),
                  onChanged: (value){
                    model.setUserName(value);
                  },
                  suffixIcon: model.userName.isNotEmpty?IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: (){
                      model.clearText();
                    },
                  ):null,
                  textEditingController: model.userNameController,
                  autovalidateMode: model.autovalidateMode,
                  validator: model.validateUserName,
                ),
                SizedBox(height: 16),
                SizedBox(height: 4),
                LoginInput(
                  hintText: "密码",
                  prefixIcon: Icon(Icons.lock),
                  onChanged: (value){
                    model.setUserPwd(value);
                  },
                  suffixIcon: IconButton(
                    icon: Icon(model.isObscure?Icons.visibility_off:Icons.visibility),
                    onPressed: (){
                      model.setObscure(!model.isObscure);
                    },
                  ),
                  obscureText: model.isObscure,
                  textEditingController: model.userPwdController,
                  autovalidateMode: model.autovalidateMode,
                  validator: model.validateUserPwd,
                ),
                SizedBox(height: 30.h),
                LoginButton(
                  loginText: KText.loginText,
                  onTap: (){
                    //提交登录请求
                    model.submitForm(loginKeyState);
                  },
                ),
                //注册按钮
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: TextButton(
                    child: Text(
                      "没有账号?去注册",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(msg: "去注册");
                    },
                  ),
                ),
                _buildBottomMenu()
              ],
            ),
          );
        },
      )
    );
  }
  ///底部第三方登录
  Widget _buildBottomMenu(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(color: Colors.grey)
          ),
          LoginTypeIconWidget(icon:"assets/icon/ic_qq.png",onTap: (){
            Get.snackbar("", "QQ登录",snackPosition:SnackPosition.BOTTOM);
          },),
          LoginTypeIconWidget(icon:"assets/icon/ic_weixin.png",onTap: (){
            Get.snackbar("", "微信登录",snackPosition:SnackPosition.BOTTOM);
          },),
          LoginTypeIconWidget(icon:"assets/icon/ic_weibo.png",onTap: (){
            Get.snackbar("", "微博登录",snackPosition:SnackPosition.BOTTOM);
          },),
          Expanded(
              child: Divider(color: Colors.grey)
          ),
        ],
      ),
    );
  }

}


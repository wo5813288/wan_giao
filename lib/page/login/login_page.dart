import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/compents/login_widget.dart';
import 'package:wan_android/controller/login_controller.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/theme/app_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginKeyState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Theme(
        data: ThemeData.light(),
        child: Stack(
          //返回按钮
          children: [
            Image.asset("assets/images/bg_login_header.png",fit: BoxFit.cover,width: double.infinity),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 250.h),
                  ClipPath(
                      clipper: LoginClipper(),
                      child: LoginBodyWidget()
                  )
                ],
              ),
            ),
            Positioned(
              top: ScreenUtil().statusBarHeight,
              left: 10.w,
              child: IconButton(
                icon: Icon(Icons.close,size: 20.w,color: Colors.black,),
                onPressed: (){
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


class LoginBodyWidget extends StatelessWidget {
  final _loginKeyState = GlobalKey<FormState>();
  var loginController = Get.find<LoginController>();
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
                  suffixIcon: loginController.isShowClearIcon.value?IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: (){
                      loginController.clearText();
                    },
                  ):null,
                  autovalidateMode: loginController.autovalidateMode.value,
                  validator: _validateUserName,
                  textEditingController: loginController.userNameController,
                );
              }),
              SizedBox(height: 16),
              Obx((){
                return LoginInput(
                  hintText: "密码",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(loginController.isObscure.value?Icons.visibility_off:Icons.visibility),
                    onPressed: (){
                      loginController.setObscure(!loginController.isObscure.value);
                    },
                  ),
                  textEditingController: loginController.userPwdController,
                  obscureText: loginController.isObscure.value,
                  autovalidateMode: loginController.autovalidateMode.value,
                  validator: _validateUserPwd,
                );
              }),
              SizedBox(height: 30.h),
              LoginButton(
                loginText: KText.loginText,
                onTap: (){
                  if(!_loginKeyState.currentState.validate()){
                   loginController.setAutovalidateMode(AutovalidateMode.always);
                    return;
                  }
                  //提交登录请求
                  loginController.submitForm();
                },
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
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
                    Get.toNamed(RoutesConfig.REGISTER_PAGE);
                  },
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              _buildBottomMenu()
            ],
          ),
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


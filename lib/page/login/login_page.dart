import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/compents/login_widget.dart';
import 'package:wan_android/controller/login/login_controller.dart';
import 'package:wan_android/theme/app_text.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
          color: Colors.white,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: TopTitleWidget(),
                flex: 1,
              ),
              Expanded(
                child: LoginBodyWidget(),
                flex: 3,
              ),
              Expanded(
                child: BottomThirdLoginMenu(),
                flex: 1,
              )
            ],
          )),
    );
  }
}

class TopTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "WAN GIAO",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontSize: ScreenUtil().setSp(30)),
          ),
          Container(
            height: ScreenUtil().setHeight(5),
          ),
          Text(
            "Good to see you again",
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(12)),
          )
        ],
      ),
    );
  }
}

class LoginBodyWidget extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
      child: Column(
        children: [
          LoginUserNameInoutWidget(
            loginInputController: userNameController,
          ),
          Container(
            height:15.h
          ),
          LoginPasswordInoutWidget(
            loginInputController: passwordController,
          ),
          Container(
            height: 20.h
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 20.w),
            child: LoginButton(
              loginText: KText.loginText,
              onTap: () {
                //请求登录
                _loginController.submitForm(userNameController.text, passwordController.text);
              },
            ),
          ),
          Padding(
            child: RegisterButton(),
            padding: EdgeInsets.only(top:10.h),
          ),
        ],
      ),
    );
  }
}


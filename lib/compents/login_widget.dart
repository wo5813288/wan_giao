import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/theme/app_color.dart';
import 'package:wan_android/theme/app_style.dart';


///登录按钮
class LoginButton extends StatelessWidget {
  final String loginText;
  final double width;
  final GestureTapCallback onTap;

  LoginButton({this.loginText, this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: 40.h,
        decoration: BoxDecoration(
            gradient: kBtnLinearGradient,
            boxShadow: [
              BoxShadow(
                  color: KColors.kBtnShadowColor,
                  offset: Offset(0, 8),
                  blurRadius: 20)
            ],
            borderRadius: BorderRadius.circular(
                20.r)),
        alignment: Alignment.center,
        child: Text(
          loginText,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp),
        ),
      ),
      onTap: onTap,
    );
  }
}

class LoginTypeIconWidget extends StatelessWidget {
  final double size;
  final String icon;
  final GestureTapCallback onTap;
  LoginTypeIconWidget({Key key, this.size, this.icon,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = 25.w;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child:InkWell(
        child:  Image.asset(icon,
            width: size ?? defaultSize, height: size ?? defaultSize),
        onTap: onTap,
      )
    );
  }
}



///用户名输入框
class LoginUserNameInoutWidget extends StatefulWidget {
  final TextEditingController loginInputController;

  LoginUserNameInoutWidget({Key key, this.loginInputController})
      : super(key: key);

  @override
  _LoginUserNameWidgetState createState() => _LoginUserNameWidgetState();
}

class _LoginUserNameWidgetState extends State<LoginUserNameInoutWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.loginInputController,
      style: kTextLoginInputStyle,
      onChanged: (v) {
        setState(() {});
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
        suffixIcon: widget.loginInputController.text.isEmpty
            ? null
            : IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.grey,
          ),
          onPressed: () {
            //清除输入的内容
            setState(() {
              widget.loginInputController.clear();
            });
          },
        ),
        hintText: "输入用户名",
        focusedBorder: kLoginInputBorder,
        errorBorder: kLoginInputBorder,
        focusedErrorBorder: kLoginInputBorder,
        enabledBorder: kLoginInputBorder,
      ),
    );
  }
}

///密码输入框
class LoginPasswordInoutWidget extends StatefulWidget {
  final TextEditingController loginInputController;
  final String hintText;
  LoginPasswordInoutWidget({Key key, this.loginInputController,this.hintText=""})
      : super(key: key);

  @override
  _LoginPasswordWidgetState createState() => _LoginPasswordWidgetState();
}

class _LoginPasswordWidgetState extends State<LoginPasswordInoutWidget> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.loginInputController,
      style: kTextLoginInputStyle,
      onChanged: (v) {
        setState(() {});
      },
      obscureText: _obscure,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey),
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
          ),
          hintText: widget.hintText,
          focusedBorder: kLoginInputBorder,
          errorBorder: kLoginInputBorder,
          focusedErrorBorder: kLoginInputBorder,
          enabledBorder: kLoginInputBorder),
    );
  }
}

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class BottomThirdLoginMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LoginTypeIconWidget(
          icon: "assets/icon/ic_qq.png",
          onTap: () {
            Get.snackbar("", "QQ登录", snackPosition: SnackPosition.BOTTOM);
          },
        ),
        LoginTypeIconWidget(
          icon: "assets/icon/ic_weixin.png",
          onTap: () {
            Get.snackbar("", "微信登录", snackPosition: SnackPosition.BOTTOM);
          },
        ),
        LoginTypeIconWidget(
          icon: "assets/icon/ic_weibo.png",
          onTap: () {
            Get.snackbar("", "微博登录", snackPosition: SnackPosition.BOTTOM);
          },
        ),
      ],
    );
  }
}

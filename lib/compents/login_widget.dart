import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_android/theme/app_color.dart';
import 'package:wan_android/theme/app_style.dart';

///登录页面剪裁曲线
class LoginClipper extends CustomClipper<Path> {
  // 第一个点
  Point p1 = Point(0.0, 54.0);
  Point c1 = Point(20.0, 25.0);
  Point c2 = Point(81.0, -8.0);

  // 第二个点
  Point p2 = Point(160.0, 20.0);
  Point c3 = Point(216.0, 38.0);
  Point c4 = Point(280.0, 73.0);

  // 第三个点
  Point p3 = Point(280.0, 44.0);
  Point c5 = Point(280.0, -11.0);
  Point c6 = Point(330.0, 8.0);

  @override
  Path getClip(Size size) {
    // 第四个点
    Point p4 = Point(size.width, .0);

    Path path = Path();
    // 移动到第一个点
    path.moveTo(p1.x, p1.y);
    //第一阶段 三阶贝塞尔曲线
    path.cubicTo(c1.x, c1.y, c2.x, c2.y, p2.x, p2.y);
    //第二阶段 三阶贝塞尔曲线
    path.cubicTo(c3.x, c3.y, c4.x, c4.y, p3.x, p3.y);
    //第三阶段 三阶贝塞尔曲线
    path.cubicTo(c5.x, c5.y, c6.x, c6.y, p4.x, p4.y);
    // 连接到右下角
    path.lineTo(size.width, size.height);
    // 连接到左下角
    path.lineTo(0, size.height);
    //闭合
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return this.hashCode != oldClipper.hashCode;
  }
}

///登录输入框控件
class LoginInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final FormFieldValidator<String> validator;
  final AutovalidateMode autovalidateMode;
  final String hintText;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final ValueChanged<String> onChanged;

  LoginInput(
      {this.textEditingController,
      this.validator,
      this.autovalidateMode,
      this.hintText,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      style:kTextLoginInputStyle ,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          focusedBorder: kInputBorder,
          errorBorder: kInputBorder,
          focusedErrorBorder: kInputBorder,
          enabledBorder: kInputBorder),
      controller: textEditingController,
      autovalidateMode: autovalidateMode,
      validator: validator,
    );
  }
}

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

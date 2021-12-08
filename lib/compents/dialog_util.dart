//加载等待提示框
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/theme/app_style.dart';
import 'package:wan_android/theme/app_text.dart';

class LoadingDialog extends StatelessWidget {
  final String message;

  LoadingDialog({Key key, this.message}) : super(key: key);

  //展示加载框
  static void show({String message = KText.loadingText}) {
    Get.dialog(LoadingDialog(message: message));
  }

  //关闭加载框
  static void dismiss() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Opacity(
          opacity: 0.7,
          child: Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                  width: 40,
                  height: 40,
                ),
                SizedBox(height: 10),
                Text(message, style: kTextLoadingStyle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///用户协议弹窗
Future showPrivacyDialog() async {
  bool agree = await Get.defaultDialog<bool>(
      title: "温馨提示",
      titleStyle: TextStyle(color: Colors.blue,fontSize: 18.sp),
      content: Container(
        height: 220.h,
        child: SingleChildScrollView(
          child: RichText(
            text: TextSpan(text: "请您在使用本产品之前仔细阅读", style:TextStyle(color: Colors.grey), children: [
              TextSpan(text: "《用户协议》", style: TextStyle(color: Colors.blue)),
              TextSpan(text: "与"),
              TextSpan(text: "《隐私协议》", style: TextStyle(color: Colors.blue)),
              TextSpan(text: KText.userPrivateProtocol)
            ]),
          ),
        ),
      ),
      radius: 5.w,
      confirm:TextButton(
        child: Text("同意",style: kPrivacyYesTextStyle,),
        onPressed: () {
          Get.back(result: true);
        },
      ),
      cancel:TextButton(
        child: Text("不同意",style: kPrivacyNoTextStyle,),
        onPressed: () {
          Get.back(result: false);
        },
      ) ,
      barrierDismissible: false,
      onWillPop: () async {
        return false;
      });
  return agree;
}

///提示用户登录弹窗
showNeedLogin(){
  Get.defaultDialog(
    title: "提示",
    content: Text("使用此功能需要登录"),
    textConfirm: "去登录"
  );
}
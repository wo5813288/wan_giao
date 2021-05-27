
//加载等待提示框
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/theme/app_style.dart';
import 'package:wan_android/theme/app_text.dart';

class LoadingDialog extends StatelessWidget {
  final String message;
  LoadingDialog({Key key,this.message}):super(key: key);
  //展示加载框
  static void show({String message = KText.loadingText}){
    Get.dialog(LoadingDialog(message: message));
  }
  //关闭加载框
  static void dismiss(){
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: CircularProgressIndicator(backgroundColor: Colors.red,),
                width: 40,
                height: 40,
              ),
              SizedBox(height: 10),
              Text(
                  message,
                  style: kTextLoadingStyle
              )
            ],
          ),
        ),
      ),
    );
  }
}

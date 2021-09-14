import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_update_dialog/flutter_update_dialog.dart';
import 'package:path_provider/path_provider.dart';

/// 应用内升级提示弹窗

class AppUpdate {
  static const _channel = MethodChannel("com.lollipop/check_update_plugin");
  static UpdateDialog _dialog;

  //检测App是否需要更新
  static checkUpdate(BuildContext context) async {
    //获取托管平台上的版本信息,这里使用的是Android原生的方式获取，所以使用插件方式调用原生方法
    var info = await _channel.invokeMethod("checkUpdate");
    //版本号
    String versionName = info["buildVersionName"];
    //是否需要更新
    bool isNewVersion = info["isNewVersion"];
    //app下载地址
    String downloadUrl = info["downloadUrl"];
    //更新内容描述
    String versionDescription = info["buildUpdateDescription"];
    if (isNewVersion) {
      _showUpdate(context, versionName, downloadUrl,versionDescription);
    }
  }

  static _showUpdate(
      BuildContext context, String versionName, String downloadUrl,String desc) {
    if (_dialog != null && _dialog.isShowing()) {
      return;
    }
    _dialog = UpdateDialog.showUpdate(context,
        width: 280.w,
        title: "是否升级到$versionName版本？",
        updateContent: desc,
        titleTextSize: 14.sp,
        contentTextSize: 12.sp,
        buttonTextSize: 12.sp,
        topImage: Image.asset('assets/images/bg_update_top.png'),
        extraHeight: 5.h,
        radius: 8.w,
        themeColor: Color(0xFFFFAC5D),
        progressBackgroundColor: Color(0x5AFFAC5D),
        isForce: true,
        updateButtonText: "升级",
        ignoreButtonText: '忽略此版本',
        enableIgnore: true, onIgnore: () {
      _dialog.dismiss();
    }, onUpdate: () {
      _downloadApp(versionName, downloadUrl);
    });
  }

  static _downloadApp(String versionName, String downloadUrl) async {
    var dir = await getExternalStorageDirectory();
    File file = File(dir.path + "/download/$versionName.apk");
    if (file.existsSync()) {
      //下载完成
      _installApk(file.path).then((value) {
        if (value) print("安装完成");
      });
      return;
    }
    await Dio().download(downloadUrl, file.path,
        onReceiveProgress: (count, total) {
      double progress = (count / total).toDouble();
      //String percent = ((count / total).toDouble() * 100).toStringAsFixed(2);
      if (progress == 1) {
        //下载完成
        _installApk(file.path).then((value) {
          if (value) print("安装完成");
        });
      }
      _dialog.update(progress);
    });
  }

  static Future _installApk(String apkPath) async {
    var channel = MethodChannel("com.lollipop/install_apk_plugin");
    return await channel.invokeMethod("installApk", {"apkPath": apkPath});
  }
}

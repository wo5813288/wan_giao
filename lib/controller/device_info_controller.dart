
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class DeviceInfoController extends GetxController{

  var versionName = "".obs;

  @override
  void onInit() {
    super.onInit();
    PackageInfo.fromPlatform().then((value){
      versionName.value = value.version;
    });
  }
}
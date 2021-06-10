import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

typedef Denied();
typedef PermanentlyDenied();
typedef Granted();

///动态权限申请框架的二次封装
class PermissionUtil {
  ///申请单独的权限
  static Future requestPermission(Permission permission,
      {Denied denied,
      PermanentlyDenied permanentlyDenied,
      Granted granted}) async {
    PermissionStatus status = await permission.request();
    switch (status) {
      case PermissionStatus.denied:
        denied();
        break;
      case PermissionStatus.permanentlyDenied:
        permanentlyDenied();
        break;
      case PermissionStatus.granted:
        //权限被允许了
        granted();
        break;
      case PermissionStatus.restricted:
        // TODO: Handle this case.
        debugPrint("===>这是restricted");
        break;
      case PermissionStatus.limited:
        debugPrint("===>这是limited");
        // TODO: Handle this case.
        break;
    }
  }
}

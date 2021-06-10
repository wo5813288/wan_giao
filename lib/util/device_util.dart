
import 'package:flutter/services.dart';

class  DeviceUtil{

  ///退出App
  static Future popApp() async{
    await SystemChannels.platform.invokeMethod("SystemNavigator.pop");
  }
}
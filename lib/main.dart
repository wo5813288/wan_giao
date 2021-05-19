import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/util/event_bus_util.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';

import 'default/default.dart';

void main() async {
  var userViewModel = UserViewModel();
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  await HttpManager.getCookieJar();
  //await HttpManager.clearCookie();
  //SpUtil.clear();

  //初始化当前是否登录过
  userViewModel.setLoginState(SpUtil.getObject(ConstantInfo.KEY_USER)!=null);
  EventBusUtil.init();
  runApp(
      ChangeNotifierProvider<UserViewModel>.value(
        value: userViewModel,
        child: MyApp(),
      )
  );

}

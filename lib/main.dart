import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/util/event_bus_util.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';
import 'package:wan_android/viewmodel/search_view_model.dart';
import 'package:wan_android/viewmodel/theme_view_model.dart';

import 'default/default.dart';

// 是否开发环境
bool get isInDebugMode => true;

// 上报异常的函数
Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');
  if (isInDebugMode) {
    print(stackTrace);
  }
  /*else {
    final SentryResponse response = await _sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );

    if (response.isSuccessful) {
      print('Success! Event ID: ${response.eventId}');
    } else {
      print('Failed to report to Sentry.io: ${response.error}');
    }
  }*/
}

Future<Null> main() async {
  // 捕获并上报 Flutter 异常
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode == true) {
      FlutterError.dumpErrorToConsole(details);
    }
    /*else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }*/
  };

  // 捕获并上报 Dart 异常
  runZonedGuarded(() async {
    await Global.init();
    var userViewModel = UserViewModel();
    var themViewModel = CurThemeData();
    //初始化当前是否登录过
    userViewModel.setLoginState(Global.userProfile.username != null);
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>.value(
          value: userViewModel,
        ),
        ChangeNotifierProvider<CurThemeData>.value(
          value: themViewModel,
        ),
      ],
      child: MyApp(),
    ));
  }, (Object error, StackTrace stack) {
    _reportError(error, stack);
  });
}

/*void main() => Global.init().then((value) {
      var userViewModel = UserViewModel();
      var themViewModel = CurThemeData();
      //初始化当前是否登录过
      userViewModel
          .setLoginState(SpUtil.getObject(ConstantInfo.KEY_USER) != null);
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<UserViewModel>.value(
            value: userViewModel,
          ),
          ChangeNotifierProvider<CurThemeData>.value(
            value: themViewModel,
          ),
        ],
        child: MyApp(),
      ));
    });*/

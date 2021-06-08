import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wan_android/default/global.dart';

import 'default/default.dart';

// 是否开发环境
bool get isInDebugMode => true;

// 上报异常的函数
Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');
  if (isInDebugMode) {
    print(stackTrace);
  }
}

Future<Null> main() async {
  // 捕获并上报 Flutter 异常
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode == true) {
      FlutterError.dumpErrorToConsole(details);
    }
  };

  // 捕获并上报 Dart 异常
  runZonedGuarded(() async {
    await Global.init();
    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    _reportError(error, stack);
  });
}

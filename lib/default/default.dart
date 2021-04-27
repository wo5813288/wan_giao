import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/page/index_page.dart';
import 'package:wan_android/route/routes_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle _style =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(_style);
    return RefreshConfiguration(
      hideFooterWhenNotFull: false,
      child: GetMaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blue,
            splashColor: Colors.white12,
            highlightColor: Colors.grey[200].withOpacity(0.7),
            accentColor: Colors.white),
        localizationsDelegates: [
          // 这行是关键
          RefreshLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesConfig.SPLASH,
        getPages: RoutesConfig.getPages,
        supportedLocales: [const Locale('zh')],
      ),
    );
  }
}

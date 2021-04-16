import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'file:///D:/androidwork/wan_android_flutter/lib/page/index_page.dart';

class MyApp extends StatelessWidget {
  final routers = {
    '/': (context) => IndexPage(),
  };

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle _style =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(_style);
    return RefreshConfiguration(
      hideFooterWhenNotFull: false,
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blue,
            splashColor: Colors.white12,
            highlightColor: Colors.grey[200].withOpacity(0.7)),
        localizationsDelegates: [
          // 这行是关键
          RefreshLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: routers,
        supportedLocales: [const Locale('zh')],
      ),
    );
  }
}

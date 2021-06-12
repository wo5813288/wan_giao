import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/route/routes_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      hideFooterWhenNotFull: false,
      child: ScreenUtilInit(
        designSize: Size(360,690),
        builder: ()=>OKToast(child: GetMaterialApp(
          //darkTheme: ThemeData.dark(),
          localizationsDelegates: [
            // 这行是关键
            RefreshLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesConfig.SPLASH,
          getPages: RoutesConfig.getPages,
          supportedLocales: [
            const Locale('zh'),
            const Locale('en','US'),
          ],
        )),
      )
    );
  }
}

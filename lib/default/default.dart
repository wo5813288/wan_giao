import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/viewmodel/theme_view_model.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      hideFooterWhenNotFull: false,
      child: Consumer<CurThemeData>(
        builder: (context,model,_){
          return ScreenUtilInit(
            designSize: Size(360,690),
            builder: ()=>GetMaterialApp(
              theme: ThemeData(
                  primaryColor:model.themColor,
                  splashColor: Colors.white12,
                  highlightColor: Colors.grey[200].withOpacity(0.7),
                  accentColor: Colors.white,
              ),
              localizationsDelegates: [
                // 这行是关键
                RefreshLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate
              ],
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesConfig.SPLASH,
              getPages: RoutesConfig.getPages,
              supportedLocales: [
                const Locale('zh'),
                const Locale('en','US'),
              ],
            ),
          );
        },
      )
    );
  }
}

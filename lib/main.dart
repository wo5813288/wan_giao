
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/generated/l10n.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/theme/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        hideFooterWhenNotFull: false,
        child:OKToast(child: GetMaterialApp(
          darkTheme: darkTheme,
          localizationsDelegates: [
            // 这行是关键
            RefreshLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate
          ],
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesConfig.SPLASH,
          getPages: RoutesConfig.getPages,
          //国际化支持的语言包
          supportedLocales: [
            const Locale('zh',"CN"),
            const Locale('en','US'),
          ],
        ))
    );
  }
}

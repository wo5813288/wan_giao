import 'package:get/get.dart';
import 'package:wan_android/compents/web_page.dart';
import 'package:wan_android/page/home/question_page.dart';
import 'package:wan_android/page/home/recommend_page.dart';
import 'package:wan_android/page/home/square_page.dart';
import 'package:wan_android/page/index_page.dart';
import 'package:wan_android/page/login/login_page.dart';
import 'package:wan_android/page/project/project_page.dart';
import 'package:wan_android/page/setting_page.dart';
import 'package:wan_android/page/splash_page.dart';
import 'package:wan_android/page/system/system_page.dart';
import 'package:wan_android/page/we_chat/we_chat_page.dart';

abstract class RoutesConfig {
  static const SPLASH = "/";
  static const MAIN = "/main";
  static const RECOMMEND = "/home/recommend";
  static const SQUARE = "/home/square";
  static const QUESTION = "/home/question";
  static const WE_CHAT = "/weChat";
  static const SYSTEM = "/system";
  static const PROJECT = "/project";
  static const MINE_PERSON = "/mine_person";
  static const LOGIN_PAGE = "/login";
  static const SETTING_PAGE="/setting_page";
  static const WEB_PAGE = "/web_page";
  
  static final List<GetPage> getPages = [
    GetPage(name: SPLASH, page: () => SplashPage()),
    GetPage(name: MAIN, page: () => IndexPage()),
    GetPage(name: RECOMMEND, page: () => RecommendPage()),
    GetPage(name: QUESTION, page: () => QuestionPage()),
    GetPage(name: SYSTEM, page: () => SystemPage()),
    GetPage(name: PROJECT, page: () => ProjectPage()),
    GetPage(name: MINE_PERSON, page: () => SplashPage()),
    GetPage(name: LOGIN_PAGE, page: () => LoginPage(),transition: Transition.downToUp),
    GetPage(name: SETTING_PAGE, page: () => SettingPage(),transition: Transition.fadeIn),
    GetPage(name: WEB_PAGE, page: () => WebPage()),
  ];
}

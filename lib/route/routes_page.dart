import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wan_android/bindings/article_collection_bindings.dart';
import 'package:wan_android/bindings/device_info_bindings.dart';
import 'package:wan_android/bindings/message_list_bindings.dart';
import 'package:wan_android/bindings/message_list_new_bindings.dart';
import 'package:wan_android/bindings/person_collection_bindings.dart';
import 'package:wan_android/bindings/person_share_bindings.dart';
import 'package:wan_android/bindings/person_stars_bindings.dart';
import 'package:wan_android/bindings/register_bindings.dart';
import 'package:wan_android/bindings/search_bindings.dart';
import 'package:wan_android/bindings/theme_bindings.dart';
import 'package:wan_android/bindings/stars_leader_bindings.dart';
import 'package:wan_android/bindings/todo_bindings.dart';
import 'package:wan_android/compents/web_page.dart';
import 'package:wan_android/controller/person_share_controller.dart';
import 'package:wan_android/controller/person_stars_controller.dart';
import 'package:wan_android/controller/starts_leader_controller.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/bindings/login_bindings.dart';
import 'package:wan_android/page/home/question_page.dart';
import 'package:wan_android/page/home/recommend_page.dart';
import 'package:wan_android/page/home/square_page.dart';
import 'package:wan_android/page/login/index_page.dart';
import 'package:wan_android/page/login/login_page.dart';
import 'package:wan_android/page/login/register_page.dart';
import 'package:wan_android/page/person/person_collection_page.dart';
import 'package:wan_android/page/person/person_message_list_page.dart';
import 'package:wan_android/page/person/person_share_page.dart';
import 'package:wan_android/page/person/person_stars_page.dart';
import 'package:wan_android/page/person/starts_leaderboard_page.dart';
import 'package:wan_android/page/project/project_page.dart';
import 'package:wan_android/page/search/search_page.dart';
import 'package:wan_android/page/set/setting_page.dart';
import 'package:wan_android/page/splash/splash_page.dart';
import 'package:wan_android/page/system/system_content_page.dart';
import 'package:wan_android/page/system/system_page.dart';
import 'package:wan_android/page/todo/todo_page.dart';
import 'package:wan_android/page/we_chat/we_chat_page.dart';

abstract class RoutesConfig {
  static const SPLASH = "/";
  static const MAIN = "/main";
  static const RECOMMEND = "/home/recommend";
  static const SQUARE = "/home/square";
  static const QUESTION = "/home/question";
  static const WE_CHAT = "/weChat";
  static const SYSTEM = "/system";
  static const SYSTEM_CONTENT = "/system/content";
  static const PROJECT = "/project";
  static const LOGIN_PAGE = "/login";
  static const REGISTER_PAGE = "/register";
  static const SETTING_PAGE = "/setting_page";
  static const WEB_PAGE = "/web_page";
  static const SEARCH_PAGE = "/search_page";
  static const PERSON_STARTS_PAGE = "/person/person_stars_page";
  static const STARTS_LEADERBOARD_PAGE = "/person/starts_leaderboard_page";
  static const PERSON_COLLECTION_PAGE = "/person/person_collection_page";
  static const PERSON_SHARE_PAGE = "/person/person_share_page";
  static const MESSAGE_LIST_PAGE = "/person/message_list_page";
  static const TODO_PAGE = "/person/todo_page";

  static final List<GetPage> getPages = [
    GetPage(
        name: SPLASH,
        page: () => SplashPage(),
        bindings: [
          DeviceInfoBindings()
        ]
    ),
    GetPage(
        name: MAIN,
        page: () => IndexPage(),
        bindings: [
          ArticleCollectionBindings(),
          RegisterBindings(),
          SearchBindings()
        ]),
    GetPage(name: RECOMMEND, page: () => RecommendPage()),
    GetPage(name: QUESTION, page: () => QuestionPage()),
    GetPage(name: SYSTEM, page: () => SystemPage()),
    GetPage(name: SYSTEM_CONTENT, page: () => SystemContentPage()),
    GetPage(name: PROJECT, page: () => ProjectPage()),
    GetPage(
        name: LOGIN_PAGE,
        page: () => LoginPage(),
        bindings: [
          LoginBindings(),
        ],
        transition: Transition.downToUp),
    GetPage(
        name: REGISTER_PAGE,
        page: () => RegisterPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: SETTING_PAGE,
        page: () => SettingPage(),
        transition: Transition.fadeIn),
    GetPage(name: WEB_PAGE, page: () => WebPage()),
    GetPage(
        name: SEARCH_PAGE,
        page: () => SearchPage(),
        //binding: SearchBindings(),
        transition: Transition.fadeIn),
    //需要登录后才能访问积分列表页面
    GetPage(
        name: PERSON_STARTS_PAGE,
        page: () => PersonStartsPage(),
        binding: PersonStarsBindings(),
        middlewares: [RouteAuthMiddleware()]),
    GetPage(
        name: STARTS_LEADERBOARD_PAGE,
        page: () => StarsLeaderboardPage(),
        binding: StarsLeaderBindings()),
    GetPage(
        name: PERSON_COLLECTION_PAGE,
        page: () => PersonCollectionPage(),
        binding: PersonCollectionBindings(),
        middlewares: [RouteAuthMiddleware()]),
    GetPage(
        name: PERSON_SHARE_PAGE,
        page: () => PersonSharePage(),
        binding: PersonShareBindings(),
        middlewares: [RouteAuthMiddleware()]),
    GetPage(
        name: MESSAGE_LIST_PAGE,
        page: () => MessageListPage(),
        bindings: [MessageListBindings(),MessageListNewBindings()],
        middlewares: [RouteAuthMiddleware()]),
    GetPage(
        name: TODO_PAGE,
        page: () => TODOPage(),
        binding: ToDoBindings(),
        middlewares: [RouteAuthMiddleware()]),
  ];
}

///路由跳转的中间鉴权，需要登录后才能访问的页面
class RouteAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String route) {
    //没有登录过，就需要去登录页面
    if (!Global.isUserOnLine) {
      return RouteSettings(name: RoutesConfig.LOGIN_PAGE);
    }
    //登录过，就不要拦截正常跳转到目标页面。
    return null;
  }
}

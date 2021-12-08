import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/bindings/article_collection_bindings.dart';
import 'package:wan_android/bindings/device_info_bindings.dart';
import 'package:wan_android/bindings/express_delivery_bindings.dart';
import 'package:wan_android/bindings/girl_bindings.dart';
import 'package:wan_android/bindings/girl_detail_bindings.dart';
import 'package:wan_android/bindings/login_bindings.dart';
import 'package:wan_android/bindings/message_list_bindings.dart';
import 'package:wan_android/bindings/message_list_new_bindings.dart';
import 'package:wan_android/bindings/news_content_bindings.dart';
import 'package:wan_android/bindings/news_list_bindings.dart';
import 'package:wan_android/bindings/person_collection_bindings.dart';
import 'package:wan_android/bindings/person_share_bindings.dart';
import 'package:wan_android/bindings/person_stars_bindings.dart';
import 'package:wan_android/bindings/register_bindings.dart';
import 'package:wan_android/bindings/search_bindings.dart';
import 'package:wan_android/bindings/stars_leader_bindings.dart';
import 'package:wan_android/bindings/todo_bindings.dart';
import 'package:wan_android/compents/web_page.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/page/girl/girl_detail_page.dart';
import 'package:wan_android/page/girl/girls_page.dart';
import 'package:wan_android/page/home/question_page.dart';
import 'package:wan_android/page/home/recommend_page.dart';
import 'package:wan_android/page/login/index_page.dart';
import 'package:wan_android/page/login/login_page.dart';
import 'package:wan_android/page/login/login_page.dart';
import 'package:wan_android/page/login/register_page.dart';
import 'package:wan_android/page/news/news_content_detail_page.dart';
import 'package:wan_android/page/news/news_list_page.dart';
import 'package:wan_android/page/person/express_delivery_page.dart';
import 'package:wan_android/page/person/person_collection_page.dart';
import 'package:wan_android/page/person/person_message_list_page.dart';
import 'package:wan_android/page/person/person_share_page.dart';
import 'package:wan_android/page/person/person_stars_page.dart';
import 'package:wan_android/page/person/starts_leaderboard_page.dart';
import 'package:wan_android/page/project/project_page.dart';
import 'package:wan_android/page/search/search_page.dart';
import 'package:wan_android/page/set/setting_page.dart';
import 'package:wan_android/page/set/theme_set_page.dart';
import 'package:wan_android/page/splash/splash_page.dart';
import 'package:wan_android/page/system/system_content_page.dart';
import 'package:wan_android/page/system/system_page.dart';
import 'package:wan_android/page/todo/todo_page.dart';

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
  static const EXPRESS_DELIVERY_PAGE = "/person/express_delivery_page";
  static const NEWS_LIST_PAGE = "/news_list_page";
  static const NEWS_CONTENT_PAGE = "/news_list_page/content";
  static const GIRL_PAGE = "/girl_page";
  static const GIRL_DETAIL_PAGE = "/detail";
  static const THEME_SET_PAGE="/theme_set_page";

  static final List<GetPage> getPages = [
    GetPage(
      name: SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(name: MAIN, page: () => IndexPage(), bindings: [
      ArticleCollectionBindings(),
      RegisterBindings(),
      SearchBindings(),
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
        binding:RegisterBindings() ,
        transition: Transition.rightToLeft),
    GetPage(
        name: SETTING_PAGE,
        page: () => SettingPage(),
        binding: DeviceInfoBindings(),
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
        bindings: [MessageListBindings(), MessageListNewBindings()],
        middlewares: [RouteAuthMiddleware()]),
    GetPage(
        name: TODO_PAGE,
        page: () => TODOPage(),
        binding: ToDoBindings(),
        middlewares: [RouteAuthMiddleware()]),
    GetPage(
        name: EXPRESS_DELIVERY_PAGE,
        page: () => ExpressDeliveryPage(),
        binding: ExpressDeliveryBindings()),

    GetPage(
        name: NEWS_LIST_PAGE,
        page: () => NewsListPage(),
        binding: NewsListBindings()),
    GetPage(
        name: NEWS_CONTENT_PAGE,
        page: () => NewsContentDetailPage(),
        binding: NewsContentBindings()),
    GetPage(
        name: GIRL_PAGE,
        page: () => GirlPage(),
        binding: GirlBindings(),
        transition:Transition.rightToLeft),
    GetPage(
        name: GIRL_DETAIL_PAGE,
        page: () => GirlDetailPage(),
        binding: GirlDetailBindings(),
        transition: Transition.zoom),
    GetPage(
        name: THEME_SET_PAGE,
        page: () => ThemeSetPage())
  ];
}

///路由跳转的中间鉴权，需要登录后才能访问的页面
class RouteAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String route) {
    //没有登录过，就需要去登录页面
    if (!appState.isLogin) {
      return RouteSettings(name: RoutesConfig.LOGIN_PAGE);
    }
    //登录过，就不要拦截正常跳转到目标页面。
    return null;
  }
}

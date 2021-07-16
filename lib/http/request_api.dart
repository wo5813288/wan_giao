class RequestApi {

  RequestApi._();

  static const String HOST = 'https://www.wanandroid.com/';
  static const String HOME_BANNER = "banner/json";
  static const String HOME_TOP = "article/top/json";
  static const String WE_CHAT = "wxarticle/chapters/json";
  static const String SYSTEM_TREE_API = "tree/json";
  static const String PROJECT_TREE_API = "project/tree/json";
  static const String PERSON_PAGE_TOP_BACKGROUND_API = "https://api.btstu.cn/sjbz/api.php?lx=dongman&format=images";
  static const String PERSON_PAGE_AVATAR = "http://api.btstu.cn/sjtx/api.php?lx=c1&format=images";

  static String QUERY_EXPRESS_BY_SINGLE_NUMBER(String singleNumber) {
    return "https://www.mxnzp.com/api/logistics/discern?logistics_no=$singleNumber"
        "&app_id=ofgmqilkocukdqjf&app_secret=by9GMlJjWVlkSzl1RVQvVW4rcGtGdz09";
  }

  static String QUERY_EXPRESS_INFO(String singleNumber,int logisticsId) {
    return "https://www.mxnzp.com/api/logistics/details/search?logistics_no=804967979558203287"
        "&logistics_id=$logisticsId&app_id=ofgmqilkocukdqjf&app_secret=by9GMlJjWVlkSzl1RVQvVW4rcGtGdz09";
  }

}

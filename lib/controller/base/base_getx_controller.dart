import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/compents/dialog_util.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/page/set/setting_page.dart';
import 'package:wan_android/route/routes_page.dart';

typedef Success(dynamic value);
typedef Failure(dynamic value);
typedef Done();

abstract class BaseGetXController extends GetxController {
  var loadState = LoadState.DONE.obs;
  int iniItemIndex = 0;
  //返回都错误结果
  var exception = ResultException(0, "null").obs;

  var errorMessage = "加载失败".obs;


  void handleRequest(Future<dynamic> future, bool isLoading, Success success,
      {Failure failure, Done done}) {
    if (isLoading) {
      loadState.value=LoadState.LOADING;
    }
    future.then((value) {
      //请求数据成功，返回请求结果
      success(value);
    }).onError<ResultException>((error, stackTrace) async {
      //请求失败
      if (isLoading) {
        loadState.value=LoadState.FAILURE;
      }
      if (error.code == HttpDioError.LOGIN_CODE) {
        logout();
        //用户需要登录才能进行操作
        Get.toNamed(RoutesConfig.LOGIN_PAGE);
      }else{
        if (failure != null) {
          failure(error.message);
        }
      }
      errorMessage.value = error.message;
    });
  }

  void initData(bool isShowLoading){

  }

  void refresh(){

  }
}

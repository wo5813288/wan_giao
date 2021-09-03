import 'package:wan_android/controller/base/base_getx_controller.dart';
import 'package:get/get.dart';

class AppState extends BaseGetXController {
  ///是否登录
  var loginState = LoginState.LOGO_OUT.obs;

  void setIsLogin(LoginState state) {
    loginState.value = state;
  }
}

enum LoginState { LOGIN, LOGO_OUT }

LoginState get loginState=>Get.find<AppState>().loginState.value;

AppState get appState=>Get.find<AppState>();
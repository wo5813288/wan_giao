import 'package:wan_android/controller/base/base_getx_controller.dart';
import 'package:get/get.dart';

enum LoginState { LOGIN, LOGO_OUT }

class AppState extends BaseGetXController {
  ///是否登录
  var _loginState = LoginState.LOGO_OUT.obs;

  void setIsLogin(LoginState state) {
    _loginState.value = state;
  }

  Rx<LoginState> get loginState => _loginState;

  //用户是否已经登录了
  bool get isLogin =>_loginState.value==LoginState.LOGIN;
}

// LoginState get loginState => Get.find<AppState>().loginState;

AppState get appState => Get.find<AppState>();

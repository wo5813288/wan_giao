import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/app/app_state.dart';
import 'package:wan_android/bean/coin_data.dart';
import 'package:wan_android/compents/constant.dart';
import 'package:wan_android/controller/base/base_getx_controller.dart';
import 'package:get/get.dart';
import 'package:wan_android/http/http_manager.dart';

class UserInfoController extends BaseGetXController {
  var _coin = Coin().obs;
  var _messageCount = 0.obs;

  Coin get coin => _coin.value;

  int get messageCount => _messageCount.value;

  @override
  void onInit() {
    super.onInit();
    getUserCoin();
    getMessage();
  }

  ///获取积分列表和排名
  void getUserCoin() {
    HttpManager.instance.get("lg/coin/userinfo/json", noCache: true).then((value){
      Coin coin = CoinData.fromJson(value).data;
      _coin.value = coin;
    });
    // handleRequest(
    //     HttpManager.instance.get("lg/coin/userinfo/json", noCache: true), false,
    //     (value) {
    //   Coin coin = CoinData.fromJson(value).data;
    //   _coin.value = coin;
    // });
  }

  void getMessage() {
    HttpManager.instance.get("message/lg/count_unread/json", noCache: true).then((value){
      _messageCount.value = value['data'];
    }).onError<ResultException>((error, stackTrace){
      print("============");
      if(error.code==HttpDioError.LOGIN_CODE){
        HttpManager.clearCookie();
        SpUtil.remove(Constant.KEY_USER);
        appState.setIsLogin(LoginState.LOGO_OUT);
      }
    });
    // handleRequest(
    //     HttpManager.instance.get("message/lg/count_unread/json", noCache: true),
    //     false, (value) {
    //   _messageCount.value = value['data'];
    // });
  }
}

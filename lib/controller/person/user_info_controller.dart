import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/bean/coin_data.dart';
import 'package:wan_android/controller/base/base_getx_controller.dart';
import 'package:get/get.dart';
import 'package:wan_android/http/http_manager.dart';

class UserInfoController extends BaseGetXController{
  var _coin=Coin().obs;
  var _messageCount = 0.obs;
  Coin get coin => _coin.value;
  int get messageCount => _messageCount.value;
  ///获取积分列表和排名
  void getUserCoin() {
    handleRequest(
        HttpManager.instance.get("lg/coin/userinfo/json", noCache: true), false,
            (value) {
          Coin coin = CoinData
              .fromJson(value)
              .data;
          _coin.value =coin;
        });
  }


  void getMessage(){
    handleRequest(
        HttpManager.instance.get("message/lg/count_unread/json", noCache: true), false,
            (value) {
          _messageCount.value = value['data'];
        });
  }
}

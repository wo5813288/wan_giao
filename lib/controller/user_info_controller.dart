import 'package:wan_android/bean/coin_data.dart';
import 'package:wan_android/controller/base_getx_controller.dart';
import 'package:get/get.dart';
import 'package:wan_android/http/http_manager.dart';

class UserInfoController extends BaseGetXController{
  var _coin=Coin().obs;

  Coin get coin => _coin.value;

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
}
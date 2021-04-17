import 'package:wan_android/bean/tip_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';

class SystemModel{
  static Future<List<TipItem>> getWehChatData() async{
    var response = await HttpManager.instance.get(RequestApi.systemApi);
    print("公众号==>${response}");
    return TipData.fromJson(response).data;
  }
}
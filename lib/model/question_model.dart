
import 'package:dio/dio.dart';
import 'package:wan_android/bean/question_data.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/http/request_api.dart';

class QuestionModel{

  ///获取问答列表数据
  static Future<QuestionResult> getQuestion(int page) async{
    var response = await HttpManager.instance.get('wenda/list/$page/json');
    print("问答==>${response}");
    return QuestionData.fromJson(response).data;
  }
}
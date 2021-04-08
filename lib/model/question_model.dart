
import 'package:dio/dio.dart';
import 'package:wan_android/bean/question_data.dart';
import 'package:wan_android/http/dio.dart';
import 'package:wan_android/http/request_api.dart';

class QuestionModel{

  ///获取问答列表数据
  static Future<QuestionResult> getQuestion(int page) async{
    var response;
    try{
      response =await XDio.getInstance().get('${RequestApi.host}wenda/list/$page/json');
      print("问答==>${response.data}");
    }on DioError catch(e){
      throw XDio.handleException(e);
    }
    return QuestionData.fromJson(response.data).data;
  }
}
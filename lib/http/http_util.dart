
import 'package:dio/dio.dart';
import 'package:wan_android/http/request_api.dart';

class HttpUtil{
  static Dio _dio;
  static Dio getInstance(){
    if(_dio==null){
      _dio = Dio(new BaseOptions(
        baseUrl: RequestApi.host,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        sendTimeout: 30000,
      ));
    }
    return _dio;
  }

  ///处理请求返回异常结果
  static ResultException handleException(DioError error){
    if(error.type==DioErrorType.DEFAULT){
      return ResultException(404, "数据加载失败，请检查网络");
    }
    return ResultException(9999, "未知错误");
  }
}

class ResultException extends DioError{
  final int code;
  final String message;
  ResultException(this.code, this.message);
}




import 'package:dio/dio.dart';

class XDio{
  static Dio _dio;
  static Dio getInstance(){
    if(_dio==null){
      _dio = Dio();
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

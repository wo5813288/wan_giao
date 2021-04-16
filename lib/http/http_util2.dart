import 'package:dio/dio.dart';
import 'package:wan_android/http/request_api.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class HttpUtil2 {
  Dio _dio;
  static HttpUtil2 _httpUtil2;

  HttpUtil2._internal() {
    _dio = Dio(new BaseOptions(
      baseUrl: RequestApi.host,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    ));
  }

  static HttpUtil2 getInstance() {
    if (_httpUtil2 == null) {
      _httpUtil2 = new HttpUtil2._internal();
    }
    return _httpUtil2;
  }

  Future getNoParams<T>({String url, Success success, Fail fail}) async {
    get<T>(url, null, success, fail);
  }

  Future get<T>(String url, Map<String, dynamic> params, Success success,
      Fail fail) async {
    try {
      var response;
      if (params == null) {
        response = await _dio.get(url);
      } else {
        response = await _dio.get(url, queryParameters: params);
      }
      var code = response.data['errorCode'];
      var msg = response.data['errorMsg'];
      if (code != 0) {
        fail(code, msg);
      } else {
        success(response.data['data']);
      }
    } on DioError catch (e) {
      ResultException exception = handleException(e);
      fail(exception.code, exception.message);
    }
  }

  ///处理请求返回异常结果
  static ResultException handleException(DioError error) {
    if(error is DioError){
      if (error.type == DioErrorType.DEFAULT) {
        return ResultException(404, "数据加载失败，请检查网络");
      }else if (error.type == DioErrorType.CONNECT_TIMEOUT ||
          error.type == DioErrorType.SEND_TIMEOUT ||
          error.type == DioErrorType.RECEIVE_TIMEOUT) {
        //  连接超时 || 请求超时 || 响应超时
        return ResultException(9990, '连接超时！');
      }
    }
    return ResultException(9999, "未知错误");
  }
}

class ResultException extends DioError {
  final int code;
  final String message;

  ResultException(this.code, this.message);
}

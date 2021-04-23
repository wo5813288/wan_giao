import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wan_android/http/request_api.dart';

class HttpManager {
  Dio _dio;

  factory HttpManager() => _getInstance();
  static HttpManager _instance;

  static HttpManager get instance => _getInstance();

  static const int TIME_OUT = 30000;

  //构造方法私有化
  HttpManager._() {
    BaseOptions options = BaseOptions(
        baseUrl: RequestApi.host,
        sendTimeout: TIME_OUT,
        receiveTimeout: TIME_OUT,
        connectTimeout: TIME_OUT);
    _dio = Dio(options);
    if (kDebugMode) {
      _dio.interceptors
          .add(LogInterceptor(request: true, responseBody: true, error: true));
    }
  }

  static HttpManager _getInstance() {
    return _instance ??= HttpManager._();
  }

  Future get(String url, {Map params}) async {
    try {
      Response response;
      if (params == null) {
        response = await _dio.get(url);
      } else {
        response = await _dio.get(url, queryParameters: params);
      }
      return response.data;
    } on DioError catch (e) {
      throw HttpDioError.handleError(e);
    }
  }

  Future post(String url, Map<String, dynamic> params) async {
    try {
      Response response;
      response = await _dio.post(url, data: params);
      return response.data;
    } on DioError catch (e) {
      throw HttpDioError.handleError(e);
    }
  }
}

class HttpDioError {
  static ResultException handleError(DioError dioError) {
    int code = 9999;
    String message = "未知错误";
    switch (dioError.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        code = 9000;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        code = 90001;
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.SEND_TIMEOUT:
        code = 90002;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.RESPONSE:
        code = 90003;
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.CANCEL:
        code = 90004;
        message = "请求已被取消，请重新请求";
        break;
      case DioErrorType.DEFAULT:
        code = 90005;
        message = "网络异常，请稍后重试！";
        break;
    }
    return ResultException(code, message);
  }
}

class ResultException {
  final int code;
  final String message;

  ResultException(this.code, this.message);
}

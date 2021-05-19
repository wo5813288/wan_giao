import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wan_android/http/request_api.dart';
import '';

class HttpManager {
  Dio _dio;

  factory HttpManager() => _getInstance();
  static HttpManager _instance;

  static HttpManager get instance => _getInstance();

  static const int TIME_OUT = 30000;
  static PersistCookieJar _cookieJar;

  //构造方法私有化
  HttpManager._() {
    BaseOptions options = BaseOptions(
        baseUrl: RequestApi.host,
        sendTimeout: TIME_OUT,
        receiveTimeout: TIME_OUT,
        connectTimeout: TIME_OUT);
    _dio = Dio(options);
    //管理cookie
    _dio.interceptors.add(CookieManager(_cookieJar));
    if (kDebugMode) {
      _dio.interceptors
          .add(LogInterceptor(request: true, responseBody: true, error: true));
    }
  }

  static HttpManager _getInstance() {
    return _instance ??= HttpManager._();
  }

  static Future<PersistCookieJar> getCookieJar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print('获取的文件系统目录 appDocPath： ' + appDocPath);
    _cookieJar = new PersistCookieJar(storage: FileStorage(appDocPath));
  }

  void addCookies(List<Cookie> cookies) async {
    await _cookieJar.loadForRequest(Uri.parse(RequestApi.host));
  }

  static void clearCookie() async{
    await _cookieJar.deleteAll();
  }

  Future get(String url, {Map<String, dynamic> params}) async {
    try {
      Response response;
      if (params == null) {
        response = await _dio.get(url);
      } else {
        response = await _dio.get(url, queryParameters: params);
      }
      if (response.data['errorCode'] != 0) {
        throw ResultException(
            response.data['errorCode'], response.data['errorMsg']);
      }
      return response.data;
    } on DioError catch (e) {
      throw HttpDioError.handleError(e);
    }
  }

  Future post(String url, {dynamic params}) async {
    try {
      Response response;
      if(params==null){
        response = await _dio.post(url);
      }else {
        response = await _dio.post(url, data: params);
      }
      if (response.data['errorCode'] != 0) {
        throw ResultException(
            response.data['errorCode'], response.data['errorMsg']);
      }
      return response.data;
    } on DioError catch (e) {
      throw HttpDioError.handleError(e);
    }
  }

  Future postFormData(String url, Map<String, dynamic> params) async {
    try {
      Response response;
      response = await _dio.post(url, data: FormData.fromMap(params));
      if (response.data['errorCode'] != 0) {
        throw ResultException(
            response.data['errorCode'], response.data['errorMsg']);
      }
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
      case DioErrorType.connectTimeout:
        code = 9000;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.receiveTimeout:
        code = 90001;
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.sendTimeout:
        code = 90002;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.response:
        code = 90003;
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.cancel:
        code = 90004;
        message = "请求已被取消，请重新请求";
        break;
      case DioErrorType.other:
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

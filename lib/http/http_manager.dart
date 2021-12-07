import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wan_android/http/net_cache.dart';
import 'package:wan_android/http/new_url_reuqest.dart';
import 'package:wan_android/http/request_api.dart';
import '';
import 'cache.dart';

class HttpManager {
  Dio _dio;
  static const int TIME_OUT = 30000;
  static HttpManager _instance;

  factory HttpManager() => _getInstance();

  static HttpManager get instance => _getInstance();

  static PersistCookieJar _cookieJar;

  //构造方法私有化
  HttpManager._() {
    BaseOptions options = BaseOptions(
        baseUrl: RequestApi.HOST,
        sendTimeout: TIME_OUT,
        receiveTimeout: TIME_OUT,
        connectTimeout: TIME_OUT);
    _dio = Dio(options);
    //管理cookie
    _dio.interceptors.add(CookieManager(_cookieJar));
    _dio.interceptors.add(NewUrlRequest());
    //加入缓存机制
    _dio.interceptors.add(NetCache());
    if (kDebugMode) {
      _dio.interceptors
          .add(LogInterceptor(request: true, responseBody: true, error: true));
    }
  }

  static HttpManager _getInstance() {
    return _instance ??= HttpManager._();
  }

  static Future initCookieJar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    _cookieJar = new PersistCookieJar(storage: FileStorage(appDocPath));
  }

  void addCookies(List<Cookie> cookies) async {
    await _cookieJar.loadForRequest(Uri.parse(RequestApi.HOST));
  }

  static Future<void> clearCookie() async {
    await _cookieJar.deleteAll();
  }

  Future get(String url,
      {Map<String, dynamic> params,
      bool refresh = false,
      bool list = false,
      bool cacheDisk = true,
      bool noCache = !CACHE_ENABLED,
      String newUrl = ""}) async {
    return request(url,
        queryParams: params,
        refresh: refresh,
        list: list,
        cacheDisk: cacheDisk,
        noCache: noCache,
        newUrl: newUrl);
  }

  Future post(String url,
      {Map<String, dynamic> params,
      bool refresh = false,
      bool list = false,
      bool cacheDisk = true,
      bool noCache = !CACHE_ENABLED,
      String newUrl = ""}) async {
    return request(url,
        params: params,
        refresh: refresh,
        method: Method.POST,
        list: list,
        cacheDisk: cacheDisk,
        noCache: noCache,
        newUrl: newUrl);
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


  request(String url,
      {Map<String, dynamic> params,
      Options option,
      Map<String, dynamic> queryParams,
      String method = Method.GET,
      bool refresh = false,
      bool list = false,
      bool cacheDisk = true,
      bool noCache = !CACHE_ENABLED,
      String newUrl = ""}) async {
    Response response;
    Options options =option??Options();
    options.extra ={
      "list":list,
      "noCache":noCache,
      "cacheDisk":cacheDisk,
      "refresh":refresh,
      "newUrl":newUrl
    };
    options.method = method;
    try{
      response = await _dio.request(url, data: params,queryParameters:queryParams,options: options);
      if(response.data['code']!=null&&response.data['code']!=1){
        throw ResultException(
            response.data['code'], response.data['msg']);
      }
      if (response.data['errorCode']!=null&&response.data['errorCode'] != 0) {
        throw ResultException(
            response.data['errorCode'], response.data['errorMsg']);
      }
      return response.data;
    } on DioError catch(e){
      throw HttpDioError.handleError(e);
    }
  }
}

class HttpDioError {
  static const int LOGIN_CODE = -1001;

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

class Method{
  static const GET = "get";
  static const POST = "post";
}

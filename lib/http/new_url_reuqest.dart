
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 该拦截器用来检查是否是不同域名的请求，如果是则不适用初始化时配置的BaseUrl
class NewUrlRequest extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String url = options.extra['newUrl'];
    if(url!=null&&url.isNotEmpty){
      //如果新地址参数部位空，则使用新地址请求
      options.path = url;
      if(url.startsWith("https://www.mxnzp.com"))
      options.headers = {
        'app_id':'riidpjorptmmtm2u',
        'app_secret':'YVVIcURwS08vKzFXc2RMMGcxVHRBUT09'
      };
    }
    handler.next(options);
  }

}
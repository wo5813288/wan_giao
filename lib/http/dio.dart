
import 'package:dio/dio.dart';

class XDio{
  static Dio _dio;
  static Dio getInstance(){
    if(_dio==null){
      _dio = Dio();
    }
    return _dio;
  }
}

import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_android/http/cache.dart';


class CacheObject{

  Response response;
  int timeStamp;
  int pageIndex;

  CacheObject({this.response,this.timeStamp,this.pageIndex});

  @override
  bool operator ==(Object other) {
    return response.hashCode == other.hashCode;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => response.realUri.hashCode;

}
class NetCache extends Interceptor{
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
      if(!CACHE_ENABLED){
        handler.next(options);
        return;
      }
      // refresh标记是否是"下拉刷新"
      bool refresh = options.extra["refresh"] == true;

      // 是否磁盘缓存
      bool cacheDisk = options.extra["cacheDisk"] == true;
      String key = options.extra["cacheKey"]??options.uri.toString();
      debugPrint("======>$key");
      // 如果是下拉刷新，先删除相关缓存
      if (refresh) {
        if (options.extra["list"] == true) {
          //若是列表，则只要url中包含当前path的缓存全部删除（简单实现，并不精准）
          var split = key.split("/");
          cache.removeWhere((key, v) => key.contains(split[0]+"/"+split[1]));
        } else {
          // 如果不是列表，则只删除uri相同的缓存
          delete(key);
        }
        // 删除磁盘缓存
        if (cacheDisk) {
          if (options.extra["list"] == true) {
            SpUtil.getKeys().forEach((element) {
              var split = options.path.split("/");
              if(element.contains(split[0]+"/"+split[1])){
                SpUtil.remove(element);
              }
            });
          } else {
            // 如果不是列表，则只删除uri相同的缓存
            await SpUtil.remove(key);
          }
        }
        handler.next(options);
        return;
      }

      if(!options.extra["noCache"]&&options.method.toLowerCase()=="get") {
        debugPrint("======>从缓存中获取数据，没有请求网络");
        debugPrint("======>${options.path}");
        var ob = cache[key];
        if (ob != null) {
          if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 < CACHE_MAXAGE) {
            return handler.resolve(cache[key].response);
          } else {
            //若已过期则删除缓存，继续向服务器请求
            cache.remove(key);
          }
        }

        // 2 磁盘缓存
        if (cacheDisk) {
          var cacheData = SpUtil.getString(key);
          if (cacheData.isNotEmpty) {
            var res = Response(
                statusCode: 200, data: jsonDecode(cacheData), requestOptions: options);
            return handler.resolve(res);
          }
        }
      }
      handler.next(options);

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if(CACHE_ENABLED){
      await _saveCache(response);
    }
    handler.next(response);
  }
  ///缓存数据
  Future<void> _saveCache(Response object){
    RequestOptions options =  object.requestOptions;
    //只缓存get请求
    if(!options.extra["noCache"]&&options.method.toLowerCase()=="get"){
      String key = options.uri.toString();
      //内存缓存
      cache[key] = CacheObject(response: object,timeStamp: DateTime.now().millisecondsSinceEpoch);
      if(options.extra["cacheDisk"]==true){
        SpUtil.putString(key, jsonEncode(object.data));
      }
    }
  }

  void delete(String key){
    cache.remove(key);
  }
}
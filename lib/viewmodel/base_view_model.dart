import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/route/routes_page.dart';
///加载状态

typedef Success(dynamic value);
typedef Failure(dynamic value);
typedef Done();
abstract class BaseViewModel with ChangeNotifier {
  LoadState _loadState;

  LoadState get loadState => _loadState;

  void setLoadState(LoadState loadState) {
    _loadState = loadState;
    notifyListeners();
  }

  //返回都错误结果
  ResultException _exception;
  ResultException get exception=>_exception;
  String errorMessage = "加载失败";
  void setRestException(ResultException exception){
    _exception = exception;
    notifyListeners();
  }
  void handleRequest(Future<dynamic> future,bool isLoading,Success success,{Failure failure,Done done}){
    if(isLoading) {
      setLoadState(LoadState.LOADING);
      notifyListeners();
    }
    future.then((value){
      //请求数据成功，返回请求结果
      success(value);
      notifyListeners();
    }).onError<ResultException>((error, stackTrace){
      //请求失败
      if(isLoading) {
        setLoadState(LoadState.FAILURE);
      }
      if(error.code==HttpDioError.LOGIN_CODE){
        //用户需要登录才能进行操作
        Get.toNamed(RoutesConfig.LOGIN_PAGE);
      }
      if(failure!=null){
        failure(error.message);
      }
      errorMessage = error.message;
      //setRestException(error);
      notifyListeners();
    });
  }
}

abstract class BaseViewModelWithRefresh extends BaseViewModel{
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  void refresh();

  void initData(bool isShowLoading);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _refreshController.dispose();
  }

}

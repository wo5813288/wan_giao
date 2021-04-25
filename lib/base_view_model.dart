import 'package:flutter/material.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/page/state_page.dart';
///加载状态

typedef Success(dynamic value);
typedef Failure(dynamic value);
typedef Done();
class BaseViewModel with ChangeNotifier {
  LoadState _loadState;

  LoadState get loadState => _loadState;

  void setLoadState(LoadState loadState) {
    _loadState = loadState;
    notifyListeners();
  }

  void handleRequest(Future<dynamic> future,Success success,{Failure failure,Done done}){
    setLoadState(LoadState.LOADING);
    future.then((value){
      success(value);
      setLoadState(LoadState.SUCCESS);
      notifyListeners();
    }).onError<ResultException>((error, stackTrace){
      setLoadState(LoadState.FAILURE);
      if(failure!=null){
        failure(error.message);
      }
      notifyListeners();
    }).whenComplete((){
      setLoadState(LoadState.DONE);
      if(done!=null){
        done();
      }
      notifyListeners();
    });
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/share_article_data.dart';
import 'package:wan_android/default/global.dart';
import 'package:wan_android/viewmodel/base_view_model.dart';
import 'package:wan_android/bean/coin_data.dart';
import 'package:wan_android/bean/coin_sign_data.dart';
import 'package:wan_android/bean/stars_leaderboadrd_data.dart';
import 'package:wan_android/bean/user_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/dialog_util.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/theme/app_text.dart';
import 'package:wan_android/util/event_bus_util.dart';

class PersonViewModel extends BaseViewModel {
  Coin _coin;

  Coin get coin => _coin;

  //设置积分数据
  void setCoin(Coin c) {
    _coin = c;
    notifyListeners();
  }

  ///获取积分列表和排名
  void getUserCoin() {
    handleRequest(HttpManager.instance.get("lg/coin/userinfo/json",noCache: true), false,
        (value) {
      Coin coin = CoinData.fromJson(value).data;
      setCoin(coin);
    });
  }
}

class UserViewModel extends BaseViewModel {
  bool _isLogin = false;

  //是否已经登录
  bool get isLogin => _isLogin;

  ///更改登录状态
  void setLoginState(bool login) {
    _isLogin = login;
    notifyListeners();
  }

  ///收藏文章
  void collectionArticle(String id, success(), failure(String value)) {
    handleRequest(HttpManager.instance.post("lg/collect/$id/json"), false,
        (value) {
      success();
    }, failure: (error) {
      failure(error);
    });
  }

  ///取消收藏文章
  void unCollectionArticle(String id, success(), failure(String value)) {
    handleRequest(
        HttpManager.instance.post("lg/uncollect_originId/$id/json"), false,
        (value) {
      success();
    }, failure: (error) {
      failure(error);
    });
  }
}

class LoginUserModel extends BaseViewModel {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPwdController = TextEditingController();
  String _userName = "";

  String get userName => _userName;

  String _userPwd = "";

  String get userPwd => _userPwd;
  bool _isObscure = true;

  bool get isObscure => _isObscure;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  TextEditingController get userNameController => _userNameController;

  TextEditingController get userPwdController => _userPwdController;

  void setObscure(bool obscure) {
    _isObscure = obscure;
    notifyListeners();
  }

  void setUserName(String userName) {
    _userName = userName.trim();
    notifyListeners();
  }

  void setUserPwd(String userPwd) {
    _userPwd = userPwd.trim();
    notifyListeners();
  }

  void clearText() {
    setUserName("");
    _userNameController.text = "";
  }

  ///验证用户是否为空
  String validateUserName(value) {
    if (value.isEmpty) {
      return "用户名不能为空";
    }
    return null;
  }

  ///验证密码规则
  String validateUserPwd(value) {
    if (value.isEmpty) {
      return "密码不能为空";
    } else if (value.length < 6) {
      return "密码不能少于六位";
    }
    return null;
  }

  ///提交登录
  void submitForm(GlobalKey<FormState> globalKey) {
    if (globalKey.currentState.validate()) {
      globalKey.currentState.save();
      LoadingDialog.show(message: KText.loginingText);
      //提交登录请求
      handleRequest(
          HttpManager.instance.postFormData(
              "user/login", {"username": _userName, "password": _userPwd}),
          true, (value) {
        var user = UserData.fromJson(value).data;
        //登录成功，记录账号和密码
        //SpUtil.putString(ConstantInfo.KEY_USER_PWD, _userPwd);
        user.setUserPassword(_userPwd);
        Global.saveUserProfile(user);
        List<Cookie> cookies = [
          Cookie('loginUserName', _userName),
          Cookie('loginUserPassword', _userPwd)
        ];
        HttpManager.instance.addCookies(cookies);
        EventBusUtil.send(UserEvent(true));
        LoadingDialog.dismiss();
        //返回上一级页面，并返回一个结果
        Get.back(result: true);
      }, failure: (error) {
            LoadingDialog.dismiss();
            Get.snackbar("错误", error,backgroundColor: Colors.red,colorText: Colors.white);
      });
    } else {
      _autovalidateMode = AutovalidateMode.always;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userNameController.dispose();
    _userPwdController.dispose();
  }
}

class PersonStartsViewModel extends BaseViewModelWithRefresh{
  List<CoinSignItem> _coinSignItems = [];
  List<CoinSignItem> get coinSigItems =>_coinSignItems;
  int pageIndex = 1;
  //获取个人积分列表
  void getPersonStarts(bool isShowLoading) async{
    handleRequest(HttpManager.instance.get("lg/coin/list/$pageIndex/json"), isShowLoading, (value){
      var coinSignResult = CoinSignData.fromJson(value).data;
      int curPage = coinSignResult.curPage;
      int pageCount = coinSignResult.pageCount;
      if(curPage==1){
        //首页
        _coinSignItems.clear();
      }
      _coinSignItems.addAll(coinSignResult.datas);
      if (curPage == 1 && coinSignResult.datas.length == 0) {
        setLoadState(LoadState.EMPTY);
      } else if (curPage == pageCount) {
        setLoadState(LoadState.NO_MORE);
        refreshController.loadNoData();
      } else {
        setLoadState(LoadState.SUCCESS);
        refreshController.loadComplete();
        pageIndex++;
      }
      refreshController.refreshCompleted(resetFooterState: true);
    }, failure: (errorMessage) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }

  @override
  void refresh() {
    pageIndex=1;
    getPersonStarts(false);
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex=1;
    getPersonStarts(isShowLoading);
  }
}

class StarsLeaderBoardViewModel extends BaseViewModelWithRefresh{
  int pageIndex = 1;
  List<Coin> _coins =[];
  List<Coin> get coins =>_coins;
  double _offset = 0;
  double get offset =>_offset;
  ScrollController _scrollController = ScrollController();
  ScrollController get scrollController =>_scrollController;
  void setOffset(double off){
    _offset = off;
    notifyListeners();
  }
  ///获取排行榜
  void getStarsLeaderBoard(bool isShowLoading){
    handleRequest(HttpManager.instance.get("coin/rank/$pageIndex/json"), isShowLoading, (value){
      var result = StarsLeaderboadrdData.fromJson(value).data;
      int curPage = result.curPage;
      int pageCount = result.pageCount;
      if(curPage==1){
        //首页
        _coins.clear();
      }
      _coins.addAll(result.datas);
      if (curPage == 1 && result.datas.length == 0) {
        setLoadState(LoadState.EMPTY);
      } else if (curPage == pageCount) {
        setLoadState(LoadState.NO_MORE);
        refreshController.loadNoData();
      } else {
        setLoadState(LoadState.SUCCESS);
        refreshController.loadComplete();
        pageIndex++;
      }
      refreshController.refreshCompleted(resetFooterState: true);
    }, failure: (errorMessage) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }

  @override
  void refresh() {
    pageIndex = 1;
    getStarsLeaderBoard(false);
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex = 1;
    getStarsLeaderBoard(isShowLoading);
  }
}


class PersonCollectionViewModel  extends BaseViewModelWithRefresh{
  List<ArticleItem> _articleItems = [];
  List<ArticleItem> get articleItems =>_articleItems;
  int pageIndex = 0;
  ///获取收藏的文章列表
  void getPersonCollectionArticle(bool isLoading,{bool refresh}){
    handleRequest(HttpManager.instance.get("lg/collect/list/$pageIndex/json",refresh: refresh,list: true), isLoading, (value){
      var result = ArticleData.fromJson(value).data;
      int curPage = result.curPage;
      int pageCount = result.pageCount;
      if(curPage==1){
        //首页
        _articleItems.clear();
      }
      _articleItems.addAll(result.datas);
      if (curPage == 1 && result.datas.length == 0) {
        setLoadState(LoadState.EMPTY);
      } else if (curPage == pageCount) {
        setLoadState(LoadState.NO_MORE);
        refreshController.loadNoData();
      } else {
        setLoadState(LoadState.SUCCESS);
        refreshController.loadComplete();
        pageIndex++;
      }
      refreshController.refreshCompleted(resetFooterState: true);
    }, failure: (errorMessage) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }
  @override
  void initData(bool isShowLoading) {
    pageIndex = 0;
    getPersonCollectionArticle(isShowLoading);
  }

  @override
  void refresh() {
    pageIndex = 0;
    getPersonCollectionArticle(false,refresh: true);
  }

  ///取消收藏文章
  void unCollectionArticle(ArticleItem articleItem) {
    handleRequest(
        HttpManager.instance.postFormData("lg/uncollect/${articleItem.id}/json",{"originId":-1}), false,
            (value) {
          _articleItems.remove(articleItem);
        }, failure: (error) {
          Fluttertoast.showToast(msg: error,backgroundColor: Colors.red);
    });
  }

}


class PersonShareViewModel  extends BaseViewModelWithRefresh{
  List<ArticleItem> _articleItems = [];
  List<ArticleItem> get articleItems =>_articleItems;
  int pageIndex = 1;
  ///获取收藏的文章列表
  void getPersonShareArticle(bool isLoading,{bool refresh}){
    handleRequest(HttpManager.instance.get("user/lg/private_articles/$pageIndex/json",refresh: refresh,list: true), isLoading, (value){
      var result = ShareArticleData.fromJson(value).data;
      int curPage = result.curPage;
      int pageCount = result.pageCount;
      if(curPage==1){
        //首页
        _articleItems.clear();
      }
      _articleItems.addAll(result.datas);
      if (curPage == 1 && result.datas.length == 0) {
        setLoadState(LoadState.EMPTY);
      } else if (curPage == pageCount) {
        setLoadState(LoadState.NO_MORE);
        refreshController.loadNoData();
      } else {
        setLoadState(LoadState.SUCCESS);
        refreshController.loadComplete();
        pageIndex++;
      }
      refreshController.refreshCompleted(resetFooterState: true);
    }, failure: (errorMessage) {
      refreshController.loadFailed();
      refreshController.refreshFailed();
    });
  }
  @override
  void initData(bool isShowLoading) {
    pageIndex = 0;
    getPersonShareArticle(isShowLoading);
  }

  @override
  void refresh() {
    pageIndex = 0;
    getPersonShareArticle(false,refresh: true);
  }

}

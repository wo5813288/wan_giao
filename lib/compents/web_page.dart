import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'file:///D:/androidwork/wan_android_flutter/lib/compents/state_page.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  String articleTitle;
  String articleUrl;
  String articleAuthor;
  Completer<WebViewController> _controller = Completer();
  LoadState _loadState;
  @override
  void initState() {
    super.initState();
    articleTitle = Get.arguments[ConstantInfo.ARTICLE_TITLE];
    articleUrl = Get.arguments[ConstantInfo.ARTICLE_URL];
    articleAuthor = Get.arguments[ConstantInfo.ARTICLE_AUTHOR]??"未知";
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.white,iconTheme: IconThemeData(color: Colors.black)),
      child: Scaffold(
          appBar: _buildAppBar(),
          body: Builder(builder: (context) {
            return Stack(
              children: [
                _buildWebView(),
                Container(
                  child: _contentState(),
                )
              ],
            );
          })),
    );
  }

  ///构建顶部bar
  Widget _buildAppBar(){
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      elevation: 0,
      titleSpacing: 0,
      title:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //作者头像
          SizedBox(
            width: ScreenUtil().setWidth(25),
            height: ScreenUtil().setWidth(25),
            child:Image.asset("assets/icon/ic_autor_avatar.png")
          ),
          SizedBox(width: 10.w),
          //作者名
          Text(
            articleAuthor,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black
            ),
          )
        ],

      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          _controller.future.then((value){
            value.canGoBack().then((back){
              back ? value.goBack() : Get.back();
            });
          });
        },
      ),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: (){
          Get.toNamed(RoutesConfig.SEARCH_PAGE);
        }),
        IconButton(icon: Icon(Icons.ios_share), onPressed: (){

        }),
        PopupMenuButton<int>(
          icon: Icon(Icons.more_vert),
          onSelected: (value) {
            if (value == 0) {
              _controller.future.then((value){
                value.reload();
              });
            }
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 0,
                child: Text("刷新"),
              ),
              PopupMenuItem(
                value: 1,
                child: Text("复制链接"),
              ),
              PopupMenuItem(
                child: Text("分享链接"),
                value: 2,
              ),
            ];
          },
        )
      ],
    );
  }


  ///构建webview显示内容
  Widget _buildWebView(){
    return  WebView(
      initialUrl: articleUrl,
      javascriptMode: JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
      onWebViewCreated: (controller) async {
        await _controller.complete(controller);
      },
      onPageStarted: (url) {;
        setState(() {
          _loadState = LoadState.LOADING;
        });
      },
      onPageFinished: (url) {
        setState(() {
          _loadState = LoadState.DONE;
        });

      },
      navigationDelegate: (NavigationRequest request){
        if(!request.url.contains("http")){
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
      onWebResourceError: (error) {
      },
    );
  }


  Widget _contentState() {
    if (_loadState == LoadState.LOADING) {
      return CircularProgressIndicatorPage();
    }
    if (_loadState == LoadState.FAILURE) {
      return NetWorkErrorPage(
        errorMeg: "加载失败",
        onPressed: ()async {
          await( await _controller.future).reload();
        },
      );
    }
    return null;
  }
}

import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/scroll_text.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  String articleTitle;
  String articleUrl;
  WebViewController _webViewController;
  LoadState _loadState;

  @override
  void initState() {
    super.initState();
    articleTitle = Get.arguments[ConstantInfo.ARTICLE_TITLE];
    articleUrl = Get.arguments[ConstantInfo.ARTICLE_URL];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            articleTitle,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: ScreenUtil.getInstance().getSp(15)),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              _webViewController.canGoBack().then((value) =>
                  {value ? _webViewController.goBack() : Get.back()});
            },
          ),
          actions: [
            PopupMenuButton<int>(
              icon: Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 0) {
                  _webViewController.reload();
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
        ),
        body: Builder(builder: (context) {
          return Stack(
            children: [
              WebView(
                initialUrl: articleUrl,
                javascriptMode: JavascriptMode.unrestricted,
                gestureNavigationEnabled: true,
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
                onPageStarted: (url) {
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
                  debugPrint("==>${request.url}");
                  if(!request.url.contains("http")){
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
                onWebResourceError: (error) {
                  debugPrint("==>${error.description}");
                  setState(() {
                    _loadState = LoadState.FAILURE;
                  });

                },
              ),
              Container(
                child: _contentState(_webViewController),
              )
            ],
          );
        }));
  }

  Widget _contentState(WebViewController webViewController) {
    if (_loadState == LoadState.LOADING) {
      return LoadingPage();
    }
    if (_loadState == LoadState.FAILURE) {
      return NetWorkErrorPage(
        errorMeg: "加载失败",
        onPressed: () {
          webViewController?.reload();
          setState(() {
            _loadState = LoadState.LOADING;
          });

        },
      );
    }
    return null;
  }
}

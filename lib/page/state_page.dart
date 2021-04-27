import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/base_view_model.dart';

enum LoadState { LOADING, SUCCESS, FAILURE, DONE, NO_MORE, EMPTY }

class EmptyPage extends StatelessWidget {
  VoidCallback onPressed;

  EmptyPage({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/no_data.png",
              width: 50,
              height: 50,
            ),
            Text("暂无数据哦"),
            Padding(padding: EdgeInsets.only(top: 10)),
            OutlinedButton(
              child: Text("点击刷新",
                  style: TextStyle(color: Colors.blue, fontSize: 15)),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColor),
      ),
    );
  }
}

class NetWorkErrorPage extends StatelessWidget {
  VoidCallback onPressed;

  NetWorkErrorPage({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/no_network.png",
              width: 50,
              height: 50,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text("当前网络不可用"),
            Padding(padding: EdgeInsets.only(top: 10)),
            OutlinedButton(
              child: Text("点击重试",
                  style: TextStyle(color: Colors.blue, fontSize: 15)),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}

///viewModel带有刷新列表的组件
class StatePageWithViewModel<T extends BaseViewModel> extends StatefulWidget {
  final T model;
  final VoidCallback onPressed;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final Widget child;
  final RefreshController controller;
  final Widget header;
  final Widget footer;

  StatePageWithViewModel(
      {this.model,
      this.onPressed,
      this.onRefresh,
      this.onLoading,
      this.child,
      this.controller,
      this.header,
      this.footer});

  @override
  _StatePageWithViewModelState createState() => _StatePageWithViewModelState();
}

class _StatePageWithViewModelState extends State<StatePageWithViewModel> {
  @override
  Widget build(BuildContext context) {
    if (widget.model.loadState == LoadState.LOADING) {
      return LoadingPage();
    } else if (widget.model.loadState == LoadState.EMPTY) {
      return EmptyPage(
        onPressed: widget.onPressed,
      );
    } else if (widget.model.loadState == LoadState.FAILURE) {
      return NetWorkErrorPage(onPressed: widget.onPressed);
    }
    return SmartRefresher(
        controller: widget.controller,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: widget.onRefresh,
        onLoading: widget.onLoading,
        header: widget.header ?? ClassicHeader(),
        footer: widget.footer ?? ClassicFooter(),
        child: widget.child);
  }
}

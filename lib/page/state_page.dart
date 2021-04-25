import 'package:flutter/material.dart';

enum LoadState { LOADING, SUCCESS, FAILURE, DONE,NO_MORE,EMPTY }

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network("assets/images/no_data.png"),
            Text("暂无数据哦"),
          ],
        ),
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
          children: [
            Image.network("assets/images/no_network.png"),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text("网络异常"),
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

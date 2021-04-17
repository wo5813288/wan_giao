import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/model/we_chat_model.dart';

class WeChatContentPage extends StatefulWidget {
  final String authorId;

  WeChatContentPage(this.authorId);

  @override
  _WeChatContentPageState createState() => _WeChatContentPageState();
}

class _WeChatContentPageState extends State<WeChatContentPage> with AutomaticKeepAliveClientMixin{
  List<ArticleItem> _articleItems = [];
  int _pageNo = 1;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _refreshController.dispose();
  }

  loadData() {
    WeChatModel.getArticleByAuthor(widget.authorId, _pageNo).then((value) {
      //如果是第一页，则需要清空之前的数据
      if (_pageNo == 1) {
        _articleItems.clear();
      }
      _articleItems.addAll(value.datas);
      int pageCount = value.pageCount;
      if (_pageNo == pageCount) {
        //没有数据了
        _refreshController.loadNoData();
      } else {
        _pageNo++;
        _refreshController.loadComplete();
      }
      _refreshController.refreshCompleted(resetFooterState: true);
      setState(() {

      });
    }).onError<ResultException>((error, stackTrace) {
      _refreshController.loadFailed();
      _refreshController.refreshFailed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      header: ClassicHeader(),
      footer: ClassicFooter(),
      onRefresh: () {
        _pageNo = 1;
        loadData();
      },
      onLoading: () {
        loadData();
      },
      child: ListView.builder(
        itemBuilder: (context, index) {
          return HomeListItemUI(articleItem: _articleItems[index]);
        },
        itemCount: _articleItems.length,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

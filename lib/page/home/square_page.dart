import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/model/square_model.dart';

class SquarePage extends StatefulWidget {
  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage>
    with AutomaticKeepAliveClientMixin {
  List<ArticleItem> _articleItems = [];
  int _curPage = 0;
  RefreshController _refreshController =
      new RefreshController(initialRefresh: false);

  void loadData() {
    SquareModel.getSquareArticle(_curPage).then((value) {
      if (_curPage == 0) {
        //加载第一页数据,清空之前的数据
        _articleItems.clear();
      }
      //加载更多数据成功
      _articleItems.addAll(value.datas);
      int pageCount = value.pageCount;
      if (_curPage < pageCount) {
        _curPage++;
        _refreshController.loadComplete();
      } else {
        _refreshController.loadNoData();
      }
      _refreshController.refreshCompleted();
      setState(() {});
    }).onError((error, stackTrace) {
      //数据刷新失败
      _refreshController.refreshFailed();
      //数据加载更多失败
      _refreshController.loadFailed();
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: () async {
          _curPage = 0;
          loadData();
        },
        onLoading: () async {
          loadData();
        },
        child: _buildListUI(),
      ),
    );
  }

  Widget _buildListUI() {
    return ListView.separated(
      itemCount: _articleItems.length,
      itemBuilder: (context, index) {
        ArticleItem articleItem = _articleItems[index];
        return HomeListItemUI(
          articleItem: articleItem,
          onTap: () {
            Fluttertoast.showToast(
                msg: articleItem.title,
                textColor: Colors.white,
                backgroundColor: Colors.blue);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 0.0,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

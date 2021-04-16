import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/question_data.dart';
import 'package:wan_android/model/question_model.dart';

///问答页面

class QuestionPage extends StatefulWidget {
  @override
  QuestionPageState createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> with AutomaticKeepAliveClientMixin {
  int _curPageNo = 0;
  List<QuestionItem> questionItems = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    QuestionModel.getQuestion(_curPageNo).then((value) {
      setState(() {
        if (_curPageNo == 0) {
          //加载第一页数据,清空之前的数据
          questionItems.clear();
        }
        //加载更多数据成功
        questionItems.addAll(value.datas);
        _refreshController.refreshCompleted();
        _refreshController.loadComplete();
      });
    }).onError((error, stackTrace) {
      //数据刷新失败
      _refreshController.refreshFailed();
      //数据加载更多失败
      _refreshController.loadFailed();
      //加载失败，页码需要回退1
      if (_curPageNo > 0) {
        _curPageNo--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: () async {
          _curPageNo = 0;
          loadData();
        },
        onLoading: () async {
          _curPageNo++;
          loadData();
        },
        controller: _refreshController,
        child: buildListUI(),
      ),
    );
  }

  Widget buildListUI() {
    return ListView.builder(
      itemCount: questionItems.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: InkWell(
            child: questionItems.length > 0
                ? buildListItem(questionItems[index])
                : Container(),
            onTap: () {
              Scaffold.of(context).showBodyScrim(true, 10);
            },
          ),
        );
      },
    );
  }

  Widget buildListItem(QuestionItem questionItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //第一行 类型 和 时间
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              borderWithGreen(questionItem.tags[0].name),
              Padding(padding: EdgeInsets.only(left: 5)),
              borderWithGreen(questionItem.tags[1].name),
              Expanded(
                child: Text(
                  questionItem.author,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        //问题标题
        Padding(
          padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
          child: Text(
            questionItem.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        //问题的内容描述
        Container(
          padding: EdgeInsets.only(left: 5, bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${questionItem.chapterName}/",
                style:
                    TextStyle(height: 1.1, fontSize: 12, color: Colors.orange),
              ),
              Text(
                "问答",
                style:
                    TextStyle(height: 1.1, fontSize: 12, color: Colors.orange),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                questionItem.niceShareDate,
                style:
                    TextStyle(height: 1.1, fontSize: 12, color: Colors.orange),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget borderWithGreen(String label) {
    return Container(
      padding: EdgeInsets.all(1),
      child: Text(
        label,
        style: TextStyle(fontSize: 10),
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(border: Border.all(color: Colors.green)),
    );
  }

  @override
  bool get wantKeepAlive =>true;
}

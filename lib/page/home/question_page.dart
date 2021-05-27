import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/question_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/viewmodel/question_view_model.dart';

///问答页面

class QuestionPage extends StatefulWidget {
  @override
  QuestionPageState createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProviderWidget<QuestionViewModel>(
        model: QuestionViewModel(),
        onReadyMore: (model) {
          model.initData(true);
        },
        builder: (context, model, child) {
          return StatePageWithViewModel(
            model: model,
            onPressed: (){
              model.initData(true);
            },
            controller: model.refreshController,
            onRefresh: () async{
              model.refresh();
            },
            onLoading: () async{
              model.getQuestion(false);
            },
            child: _buildListUI(model)
          );
        },
      ),
    );
  }

  Widget _buildListUI(QuestionViewModel model) {
    return ListView.builder(
      itemCount: model.questionItems.length,
      itemBuilder: (context, index) {
        QuestionItem questionItem = model.questionItems[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: InkWell(
            child: model.questionItems.length > 0
                ? _buildListItem(model.questionItems[index])
                : Container(),
            onTap: () {
              //Scaffold.of(context).showBodyScrim(true, 10);
              Get.toNamed(RoutesConfig.WEB_PAGE, arguments: {
                ConstantInfo.ARTICLE_TITLE: questionItem.title,
                ConstantInfo.ARTICLE_URL: questionItem.link
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildListItem(QuestionItem questionItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //第一行 类型 和 时间
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              _borderWithGreen(questionItem.tags[0].name),
              Padding(padding: EdgeInsets.only(left: 5)),
              _borderWithGreen(questionItem.tags[1].name),
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

  Widget _borderWithGreen(String label) {
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
  bool get wantKeepAlive => true;
}

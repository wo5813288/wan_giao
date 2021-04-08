import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wan_android/bean/question_data.dart';
import 'package:wan_android/model/question_model.dart';

///问答页面

class QuestionPage extends StatefulWidget {
  @override
  QuestionPageState createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  int _curPageNo = 1;
  List<QuestionItem> questionItems = [];

  @override
  void initState() {
    super.initState();
    QuestionModel.getQuestion(_curPageNo).then((value) {
      setState(() {
        questionItems.addAll(value.datas);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "问答",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: buildListUI(),
    );
  }

  Widget buildListUI() {
    return ListView.builder(
      itemCount: questionItems.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
       /* Container(
          height: 150,
            child: Html(
          data: questionItem.desc,
          shrinkWrap: true,
        )),*/
        Container(
          padding: EdgeInsets.only(left: 5, bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "官方/",
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
                "2021-03-18 23:20",
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
}

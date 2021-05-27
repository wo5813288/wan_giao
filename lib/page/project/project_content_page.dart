
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/viewmodel/project_view_model.dart';
import 'package:wan_android/viewmodel/we_chat_view_model.dart';

class ProjectContentPage extends StatefulWidget {
  final String authorId;
  ProjectContentPage(this.authorId);

  @override
  _ProjectContentPageState createState() => _ProjectContentPageState();
}

class _ProjectContentPageState extends State<ProjectContentPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ProjectViewModel>(
      model: ProjectViewModel(),
      onReadyMore: (model){
        model.getProjectList(true, widget.authorId);
      },
      builder: (context,model,child){
        return StatePageWithViewModel(
            model: model,
            onPressed: (){
              model.getProjectList(true, widget.authorId);
            },
            controller: model.controller,
            onRefresh: () async{
              model.refresh(widget.authorId);
            },
            onLoading: () async{
              model.getProjectList(false, widget.authorId);
            },
            child:_buildListUI(model.articleItems)
        );
      },
    );
  }

  Widget _buildListUI(List articleItems){
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildListItemUI(articleItems[index]);
      },
      itemCount:  articleItems.length,
    );
  }

  Widget _buildListItemUI(ArticleItem articleItem){
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 15,right: 10, bottom: 5,left: 10),
        child: InkWell(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(articleItem.envelopePic,fit: BoxFit.cover,width: 80,height: 100,),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ///第一行 作者
                          Text(
                            articleItem.shareUser.isEmpty? articleItem.author: articleItem.shareUser,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          //第一行 右侧 时间
                          Expanded(
                            child:Text(
                              articleItem.niceDate,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      //中间的标题
                      Text(articleItem.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Text(articleItem.desc,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top:8)),
                      //底部的文章类型
                      Text(
                        "${articleItem.superChapterName}/${articleItem.chapterName}",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
            onTap:(){
              Get.toNamed(
                  RoutesConfig.WEB_PAGE,
                  arguments: {
                    ConstantInfo.ARTICLE_TITLE:articleItem.title,
                    ConstantInfo.ARTICLE_URL:articleItem.link
                  });
            }));
  }

  @override
  bool get wantKeepAlive => true;
}


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/controller/project_controller.dart';
import 'file:///D:/androidwork/wan_android_flutter/lib/compents/state_page.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectContentPage extends StatefulWidget {
  final String authorId;
  ProjectContentPage(this.authorId);

  @override
  _ProjectContentPageState createState() => _ProjectContentPageState();
}

class _ProjectContentPageState extends State<ProjectContentPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return GetX<ProjectController>(
      init: Get.put<ProjectController>(ProjectController(),tag: widget.authorId),
      initState: (_){
        var controller =Get.find<ProjectController>(tag: widget.authorId);
        controller.setCid(widget.authorId);
        controller.initData(true);
      },
      builder: (_){
        return StatePageWithViewController<ProjectController>(
            model: Get.find<ProjectController>(tag: widget.authorId),
            controller: Get.find<ProjectController>(tag: widget.authorId).refreshController,
            onPressed: (){
              Get.find<ProjectController>(tag: widget.authorId).initData(true);
            },
            onRefresh: () async{
              Get.find<ProjectController>(tag: widget.authorId).refresh();
            },
            onLoading: () async{
              Get.find<ProjectController>(tag: widget.authorId).getProjectList(false);
            },
            child:_buildListUI(Get.find<ProjectController>(tag: widget.authorId).articleItems)
        );
      },
    );
  }

  Widget _buildListUI(List articleItems){
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildListItemUI(articleItems[index]);
      },
      itemCount:articleItems.length,
    );
  }

  Widget _buildListItemUI(ArticleItem articleItem){
    return Container(
        height: 120.h,
        padding: EdgeInsets.only(top: 15,right: 10, bottom: 5,left: 10),
        child: InkWell(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: articleItem.envelopePic,
                  fit: BoxFit.cover,
                  width: 80.w,
                  height: 100.h,
                ),
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
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).textTheme.headline1.color,
                              fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Text(articleItem.desc,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).textTheme.bodyText1.color
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

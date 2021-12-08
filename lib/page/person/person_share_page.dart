import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/compents/constant.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/person/person_share_controller.dart';
import 'package:wan_android/route/routes_page.dart';

class PersonSharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("我的分享"),
        centerTitle: true,
      ),
      body: ShareListPage(),
    );
  }
}

class ShareListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<PersonShareController>(
      initState: (_){
        Get.find<PersonShareController>().initData(true);
      },
      builder: (controller) {
        return StatePageWithViewController<PersonShareController>(
            model: controller,
            controller: controller.refreshController,
            onRefresh: () async {
              controller.refresh();
            },
            onLoading: () async {
              controller.getPersonShareArticle(false);
            },
            emptyPage: ShareEmptyPage(onPressed: (){
              showToast("去分享文章");
            },),
            child: ListView.separated(
              itemBuilder: (context, index) {
                List<ArticleItem> items = controller.articleItems;
                return _buildContentList(controller, items, items[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: ScreenUtil().setHeight(1));
              },
              itemCount: controller.articleItems.length,
            ));
      },
    );
  }

  ///每个item的布局
  Widget _buildContentList(PersonShareController model,
      List<ArticleItem> items, ArticleItem articleItem) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(5),
            vertical: ScreenUtil().setHeight(0)),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.35,
          secondaryActions: [
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                //TODO: 删除自己分享文章
              },
            ),
          ],
          child: InkWell(
              onTap: () {
                Get.toNamed(RoutesConfig.WEB_PAGE, arguments: {
                  Constant.ARTICLE_TITLE: articleItem.title,
                  Constant.ARTICLE_URL: articleItem.link,
                  Constant.ARTICLE_AUTHOR: articleItem.author,
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ///第一行 作者
                            Text(
                              articleItem.author,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            //第一行 右侧 时间
                            Expanded(
                              child: Text(
                                articleItem.niceDate,
                                textAlign: TextAlign.right,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        //中间的标题
                        Text(articleItem.title.trim(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        //底部的文章类型
                        Text(
                          "${articleItem.chapterName}",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}

class ShareEmptyPage extends StatelessWidget {
  final VoidCallback onPressed;

  ShareEmptyPage({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_data.png",
              width: 50,
              height: 50,
            ),
            Text("还没有分享过文章哦，快去分享吧",style: TextStyle(color: Colors.grey),),
            Padding(padding: EdgeInsets.only(top: 10)),
            OutlinedButton(
              child: Text("点击分享",
                  style: TextStyle(color: Colors.blue, fontSize: 15)),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}

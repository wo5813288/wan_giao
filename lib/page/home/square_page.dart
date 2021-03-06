import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/compents/constant.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/home/square_controller.dart';
import 'package:wan_android/route/routes_page.dart';

class SquarePage extends StatefulWidget {
  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> with AutomaticKeepAliveClientMixin {
  var _squareController = Get.put<SquareController>(SquareController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<SquareController>(
        init: _squareController,
        initState: (_){
          _squareController.initData(true);
        },
        builder: (squareController){
          return StatePageWithViewController<SquareController>(
            model: squareController,
            controller: squareController.refreshController,
            onPressed: () {
              squareController.initData(true);
            },
            onRefresh: () async {
              squareController.refresh();
            },
            onLoading: () async {
              squareController.getSquareArticle(false);
            },
            child: _buildListUI(squareController),
          );
        },
      ),
    );
  }

  Widget _buildListUI(SquareController model) {
    return ListView.separated(
      itemCount: model.articleItems.length,
      itemBuilder: (context, index) {
        ArticleItem articleItem = model.articleItems[index];
        return HomeListItemUI(
          articleItem: articleItem,
          onTap: () {
            Get.toNamed(RoutesConfig.WEB_PAGE, arguments: {
              Constant.ARTICLE_TITLE: articleItem.title,
              Constant.ARTICLE_URL: articleItem.link
            });
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

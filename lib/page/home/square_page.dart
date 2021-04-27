import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/viewmodel/square_view_model.dart';

class SquarePage extends StatefulWidget {
  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProviderWidget<SquareViewModel>(
        model: SquareViewModel(),
        onReadyMore: (model){
          model.getSquareArticle(true);
        },
        builder: (context,model,child){
          return StatePageWithViewModel(
            model: model,
            onPressed: (){
              model.getSquareArticle(true);
            },
            controller: model.refreshController,
            onRefresh: () async{
              model.refresh();
            },
            onLoading: () async{
              model.getSquareArticle(false);
            },
            child: _buildListUI(model),
          );
        },
      ),
    );
  }

  Widget _buildListUI(SquareViewModel model) {
    return ListView.separated(
      itemCount: model.articleItems.length,
      itemBuilder: (context, index) {
        ArticleItem articleItem = model.articleItems[index];
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

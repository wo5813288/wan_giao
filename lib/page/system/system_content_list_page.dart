
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/route/routes_page.dart';
import 'package:wan_android/viewmodel/system_view_model.dart';
import 'package:wan_android/viewmodel/we_chat_view_model.dart';

class SystemContentListPage extends StatefulWidget {
  final String cid;
  SystemContentListPage(this.cid);

  @override
  _SystemContentListPageState createState() => _SystemContentListPageState();
}

class _SystemContentListPageState extends State<SystemContentListPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SystemContentViewModel>(
      model: SystemContentViewModel(),
      onReadyMore: (model){
        model.getArticleBySystem(true, widget.cid);
      },
      builder: (context,model,child){
        return StatePageWithViewModel<SystemContentViewModel>(
          model: model,
          onPressed: (){
            model.getArticleBySystem(true, widget.cid);
          },
          controller: model.refreshController,
          onRefresh: () async{
            model.refresh(widget.cid);
          },
          onLoading: () async{
            model.getArticleBySystem(false, widget.cid);
          },
          child:ListView.builder(
            itemBuilder: (context, index) {
              return HomeListItemUI(
                  articleItem: model.articleItems[index],
              );
            },
            itemCount:  model.articleItems.length,
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

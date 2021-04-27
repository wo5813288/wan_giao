
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/viewmodel/we_chat_view_model.dart';

class WeChatContentPage extends StatefulWidget {
  final String authorId;
  WeChatContentPage(this.authorId);

  @override
  _WeChatContentPageState createState() => _WeChatContentPageState();
}

class _WeChatContentPageState extends State<WeChatContentPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<WeChatViewModel>(
      model: WeChatViewModel(),
      onReadyMore: (model){
        model.getArticleByAuthor(true, widget.authorId);
      },
      builder: (context,model,child){
        return StatePageWithViewModel<WeChatViewModel>(
          model: model,
          onPressed: (){
            model.getArticleByAuthor(true, widget.authorId);
          },
          controller: model.refreshController,
          onRefresh: () async{
            model.refresh(widget.authorId);
          },
          onLoading: () async{
            model.getArticleByAuthor(false, widget.authorId);
          },
          child:ListView.builder(
            itemBuilder: (context, index) {
              return HomeListItemUI(articleItem: model.articleItems[index]);
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

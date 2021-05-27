import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/compents/search_view.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/viewmodel/search_view_model.dart';

class SearchResultPage extends StatefulWidget {
  final String queryKey;
  final SearchResultViewModel resultViewModel;
  SearchResultPage(this.queryKey,{Key key,this.resultViewModel}):super(key: key);
  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  void initState() {
    super.initState();
    widget.resultViewModel.initalSearchArticle(widget.queryKey);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: widget.resultViewModel,
        child: Consumer<SearchResultViewModel>(
          builder: (context,model,_){
            return StatePageWithViewModel<SearchResultViewModel>(
              controller: model.refreshController,
              model: model,
              onLoading: ()async{
                model.loadArticleBySearchKey(widget.queryKey,false);
              },
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return HomeListItemUI(
                    articleItem: model.articleItems[index],
                  );
                },
                itemCount:  model.articleItems.length,
              ),
            );
          },
        ),
      ),
    );
  }
}

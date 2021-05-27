
import 'package:flutter/material.dart';
import 'package:wan_android/bean/coin_sign_data.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';

///个人积分
class PersonStartsPage extends StatefulWidget {
  @override
  _PersonStartsPageState createState() => _PersonStartsPageState();
}

class _PersonStartsPageState extends State<PersonStartsPage> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          "积分列表"
        ),
      ),
      body: ProviderWidget<PersonStartsViewModel>(
        model: PersonStartsViewModel(),
        onReadyMore: (model){
          model.initData(true);
        },
        builder: (context,model,_){
          return _buildContentUI(model);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.vertical_align_top),
        onPressed: (){
          //滑动到最顶部
          _scrollController.animateTo(0.0, duration: Duration(milliseconds: 500), curve: Curves.linear);
        },
      ),
    );
  }

  Widget _buildContentUI(PersonStartsViewModel model){
    return StatePageWithViewModel<PersonStartsViewModel>(
      model: model,
      controller: model.refreshController,
      onPressed: () async{
        model.refresh();
      },
      onLoading: () async{
        model.getPersonStarts(false);
      },
      child: ListView.separated(
        controller: _scrollController,
        itemCount: model.coinSigItems.length,
        itemBuilder: (context,index){
          CoinSignItem item = model.coinSigItems[index];
          return ListTile(
            title: Text(item.desc),
          );
        },
        separatorBuilder: (context,index){
          return Divider(thickness: 1,color: Colors.grey);
        },
      ),
    );
  }
}

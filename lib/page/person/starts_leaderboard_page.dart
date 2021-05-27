import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/coin_data.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';

///排行榜
class StarsLeaderboardPage extends StatefulWidget {
  @override
  _StarsLeaderboardPageState createState() => _StarsLeaderboardPageState();
}

class _StarsLeaderboardPageState extends State<StarsLeaderboardPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ProviderWidget<StarsLeaderBoardViewModel>(
        model: StarsLeaderBoardViewModel(),
        onReadyMore: (model){
          model.scrollController.addListener(() {
            model.setOffset(model.scrollController.offset);
          });
          model.getStarsLeaderBoard(true);
        },
        builder: (context,model,_){
          return SmartRefresher(
            controller: model.refreshController,
            enablePullUp: true,
            enablePullDown: false,
            /*
            onRefresh: ()async{
              model.refresh(false);
            },*/
            onLoading: () async{
              model.getStarsLeaderBoard(false);
            },
            child:  CustomScrollView(
              controller: model.scrollController,
              slivers: [
                _buildTopUI(model),
                _buildBodyContent(model)
              ],
            ),
          );
        },
      )
    );
  }

  ///头部UI
  Widget _buildTopUI(StarsLeaderBoardViewModel model){
    return SliverAppBar(
      title: model.offset>=120?Text("排行榜"):Container(),
      pinned: true,
      stretch: true,
      brightness: Brightness.dark,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: (){
          Get.back();
        },
      ),
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.fadeTitle,
          StretchMode.zoomBackground,
        ],
        background: Container(
            padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight+50.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.orange,
                    Colors.orangeAccent,
                    Colors.grey
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),
            ),
            child:Center(
                child: _buildTopContent(model)
            )
        ),
      ),
      expandedHeight:180.h,
    );
  }

  Widget _buildTopContent(StarsLeaderBoardViewModel model){
    return model.coins.length>=3? Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LeaderBoardIcon(
            icon: "assets/icon/ic_no_2.png",
            iconSize: 40,
            name: model.coins[1].username,
            coins: model.coins[1].coinCount.toString(),
          ),
          LeaderBoardIcon(
            icon: "assets/icon/ic_no_1.png",
            iconSize: 55,
            name: model.coins[0].username,
            coins: model.coins[0].coinCount.toString(),
          ),
          LeaderBoardIcon(
            icon: "assets/icon/ic_no_3.png",
            iconSize: 40,
            name: model.coins[2].username,
            coins: model.coins[2].coinCount.toString(),
          ),
        ]
    ):Container();
  }

  Widget _buildBodyContent(StarsLeaderBoardViewModel model){
    if(model.loadState==LoadState.EMPTY){
      return SliverFillRemaining(
        child: EmptyPage(),
      );
    }else if(model.loadState==LoadState.FAILURE){
      return SliverFillRemaining(
        child: NetWorkErrorPage(),
      );
    }else if(model.loadState==LoadState.LOADING){
      return SliverFillRemaining(
        child: LoadingPage(),
      );
    }
    return SliverList(
      delegate:SliverChildListDelegate(
          model.coins.getRange(3, model.coins.length).map((e){
            return ListTile(
              title: Text(e.username),
              subtitle: Text(e.userId.toString()),
              trailing: Text(e.coinCount.toString()),
              leading: Container(
                width: 30,
                alignment: Alignment.center,
                child:CircleAvatar(
                  child: Text(
                      e.rank
                  ),
                )
              )
            );
          }).toList()
      ),
    );
  }
}
class LeaderBoardIcon extends StatelessWidget {
  final String icon;
  final String name;
  final String coins;
  final double iconSize;
  final double textSize;
  LeaderBoardIcon({Key key,this.icon,this.name,this.coins,this.iconSize,this.textSize}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon,width: iconSize,height: iconSize),
        Text(name,style: TextStyle(
          fontSize: textSize,
          color: Colors.white
        )),
        Text(coins,style: TextStyle(
            fontSize: textSize,
            color: Colors.white
        ))
      ],
    );
  }
}




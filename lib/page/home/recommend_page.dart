import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/compents/smart_refresh_header_style.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/viewmodel/home_view_model.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ProviderWidget<HomeViewModel>(
        model: HomeViewModel(),
        builder: (context, model, child) {
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: GifHeader1(),
            controller: model.refreshController,
            //刷新数据事件
            onRefresh: () async {
              model.refreshRecommendArticle(false);
            },
            //加载更多数据事件
            onLoading: () async {
              //页面加1
              model.getHomeArticle(false);
            },
            child: CustomScrollView(
              slivers: [
                //轮播图
                _buildBannerUI(model),
                //置顶文章列表
                _buildTopArticleListUI(model),
                //列表数据
                _buildArticleListUI(model),
              ],
            ),
          );
        },
        onReadyMore: (model) {
          model.refreshRecommendArticle(true);
        },
      ),
    );
  }

  ///轮播图_buildSwiperUI(_banners),
  Widget _buildBannerUI(HomeViewModel model) {
    return SliverToBoxAdapter(
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: _buildSwiperUI(model.bannerItems)),
    );
  }

  Widget _buildSwiperUI(List<BannerItem> banners) {
    return Container(
      height: 130,
      child: banners.length > 0
          ? Swiper(
              itemBuilder: (context, index) {
                ///图片边框圆角
                return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      banners[index].imagePath,
                      fit: BoxFit.cover,
                    ));
              },
              itemCount: banners.length,
              autoplay: true,
              pagination: SwiperPagination(
                  alignment: Alignment.bottomRight,
                  //图片右下角的指示器大小
                  builder: DotSwiperPaginationBuilder(size: 5, activeSize: 5)),
              //点击事件
              onTap: (index) {
                Fluttertoast.showToast(msg: banners[index].title);
              },
            )
          : FlutterLogo(size: 60),
    );
  }

  ///创建toplist列表
  Widget _buildTopArticleListUI(HomeViewModel model) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        ArticleItem articleItem = model.topArticleItems[index];
        return HomeListItemUI(
          articleItem: articleItem,
          isTop: true,
          onTap: () {
            Fluttertoast.showToast(
                msg: articleItem.title,
                textColor: Colors.white,
                backgroundColor: Colors.blue);
          },
        );
      }, childCount: model.topArticleItems.length),
    );
  }

  ///创建ListView列表
  Widget _buildArticleListUI(HomeViewModel model) {
    if (model.loadState == LoadState.LOADING) {
      return SliverFillRemaining(
        child: LoadingPage(),
      );
    } else if (model.loadState == LoadState.EMPTY) {
      return SliverFillRemaining(
        child: EmptyPage(onPressed: (){
          model.refreshRecommendArticle(true);
        }),
      );
    } else if (model.loadState == LoadState.FAILURE) {
      return SliverFillRemaining(
        child:  NetWorkErrorPage(onPressed: (){
          model.refreshRecommendArticle(true);
        }),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
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
      }, childCount: model.articleItems.length),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

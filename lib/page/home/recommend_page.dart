import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/compents/contrants_info.dart';
import 'package:wan_android/compents/smart_refresh_header_style.dart';
import 'package:wan_android/controller/recommond_controller.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/route/routes_page.dart';


class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> with AutomaticKeepAliveClientMixin {
  var _recommendController = Get.put<RecommendController>(RecommendController());
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GetX<RecommendController>(
        initState: (_){
          _recommendController.initData(true);
        },
        builder: (_){
          return SmartRefresher(
            controller: _recommendController.refreshController,
            header: GifHeader1(),
            enablePullUp: true,
            enablePullDown: true,
            onRefresh: ()async{
              _recommendController.refresh();
            },
            onLoading: () async{
              _recommendController.getHomeArticle(false);
            },
            child: CustomScrollView(
              slivers: [
                //轮播图
                _buildBannerUI(_recommendController),//置顶文章列表
                _buildTopArticleListUI(_recommendController),
                //列表数据
                _buildArticleListUI(_recommendController),
              ],
            ),
          );
        },
      )
    );
  }

  ///轮播图_buildSwiperUI(_banners),
  Widget _buildBannerUI(RecommendController model) {
    return SliverToBoxAdapter(
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10.w),
          child: _buildSwiperUI(model.bannerItems)),
    );
  }

  Widget _buildSwiperUI(List<BannerItem> banners) {
    return Container(
      height: ScreenUtil().setHeight(120),
     child: Swiper(
       itemBuilder: (context, index) {
         ///图片边框圆角
         return ClipRRect(
             borderRadius: BorderRadius.all(Radius.circular(10)),
             child: CachedNetworkImage(
               imageUrl: banners[index].imagePath,
               placeholder: (context,url){
                 return Image.asset("assets/images/default_project_img.png",fit: BoxFit.cover);
               },
               errorWidget: (context,url,error)=>Icon(Icons.error),
               fit: BoxFit.cover,
             )
         );
       },
       itemCount: banners.length,
       autoplay: true,
       pagination: SwiperPagination(
           alignment: Alignment.bottomRight,
           //图片右下角的指示器大小
           builder: DotSwiperPaginationBuilder(size: 5, activeSize: 5)),
       //点击事件
       onTap: (index) {
         Get.toNamed(
             RoutesConfig.WEB_PAGE,
             arguments: {
               ConstantInfo.ARTICLE_TITLE:banners[index].title,
               ConstantInfo.ARTICLE_URL:banners[index].url,
               ConstantInfo.ARTICLE_AUTHOR:banners[index].desc,
             });
       },
     ),
    );
  }

  ///创建toplist列表
  Widget _buildTopArticleListUI(RecommendController model) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        ArticleItem articleItem = model.topArticleItems[index];
        return HomeListItemUI(
          articleItem: articleItem,
          isTop: true,

        );
      }, childCount: model.topArticleItems.length),
    );
  }

  ///创建ListView列表
  Widget _buildArticleListUI(RecommendController model) {
    if (model.loadState.value == LoadState.LOADING) {
      return SliverFillRemaining(
        child: LoadingPage(),
      );
    } else if (model.loadState.value == LoadState.EMPTY) {
      return SliverFillRemaining(
        child: EmptyPage(onPressed: (){
          model.initData(true);
        }),
      );
    } else if (model.loadState.value == LoadState.FAILURE) {
      return SliverFillRemaining(
        child:  NetWorkErrorPage(onPressed: (){
          model.initData(true);
        }),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        ArticleItem articleItem = model.articleItems[index];
        return HomeListItemUI(
          articleItem: articleItem,
        );
      }, childCount: model.articleItems.length),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_data.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/compents/smart_refresh_header_style.dart';
import 'package:wan_android/model/home_model.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> with AutomaticKeepAliveClientMixin {
  List<BannerItem> _banners = [];
  List<ArticleItem> _articles = [];
  List<ArticleItem> _topArticles = [];
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  int _curPageNo = 0;
  @override
  void initState() {
    super.initState();
    _refresh();
  }
  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }
  ///加载文章列表
  void loadArticles() {
    HomeModel.getHomeArticle(_curPageNo).then((value) {
      setState(() {
        if (_curPageNo == 0) {
          //加载第一页数据,清空之前的数据
          _articles.clear();
        }
        //加载更多数据成功
        _articles.addAll(value.datas);
        _refreshController.refreshCompleted();
        _refreshController.loadComplete();
      });
    }).onError((error, stackTrace) {
      //数据刷新失败
      _refreshController.refreshFailed();
      //数据加载更多失败
      _refreshController.loadFailed();
      //加载失败，页码需要回退1
      if (_curPageNo > 0) {
        _curPageNo--;
      }
    });
  }

  ///刷新数据
  void _refresh() {
    //请求首页Banner数据
    HomeModel.getHomeBanner().then((value) {
      setState(() {
        _banners = value;
      });
    });
    //请求首页置顶文章
    HomeModel.getHomeTopArticle().then((value) {
      setState(() {
        _topArticles = value;
      });
    });
    loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: GifHeader1(),
          controller: _refreshController,
          //刷新数据事件
          onRefresh: () async {
            _curPageNo = 0;
            _refresh();
          },
          //加载更多数据事件
          onLoading: () async {
            //页面加1
            _curPageNo++;
            loadArticles();
          },
          child: CustomScrollView(
            slivers: [
              //轮播图
              _buildBannerUI(),
              //置顶文章列表
              _buildTopArticleListUI(),
              //列表数据
              _buildArticleListUI(),
            ],
          ),
        ),
    );
  }
  ///轮播图
  Widget _buildBannerUI() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: _buildSwiperUI(_banners),
      ),
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
          Fluttertoast.showToast(msg: _banners[index].title);
        },
      )
          : FlutterLogo(size: 60),
    );
  }
  ///创建toplist列表
  Widget _buildTopArticleListUI() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        ArticleItem articleItem = _topArticles[index];
        return HomeListItemUI(
          articleItem: articleItem,
          isTop: true,
          onTap: (){
            Fluttertoast.showToast(
                msg: articleItem.title,
                textColor: Colors.white,
                backgroundColor: Colors.blue);
          },
        );
      }, childCount: _topArticles.length),
    );
  }
  ///创建ListView列表
  Widget _buildArticleListUI() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        ArticleItem articleItem = _articles[index];
        return HomeListItemUI(
          articleItem: articleItem,
          onTap: (){
            Fluttertoast.showToast(
                msg: articleItem.title,
                textColor: Colors.white,
                backgroundColor: Colors.blue);
          },
        );
      }, childCount: _articles.length),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

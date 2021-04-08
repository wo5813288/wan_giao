import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/bean/article_item.dart';
import 'package:wan_android/bean/banner_data.dart';
import 'package:wan_android/compents/smart_refresh_header_style.dart';
import 'package:wan_android/model/home_model.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  List<BannerItem> _banners = [];
  List<ArticleItem> _articles = [];
  List<ArticleItem> _topArticles = [];
  int _curPageNo = 0;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ///重写此方法 保存页面数据状态，防止切换页面后数据重新加载，另外需要配合PageView使用
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildTopBarUI(),
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

  ///头部搜索框
  Widget _buildTopBarUI() {
    return AppBar(
      title: Container(
        padding: EdgeInsets.only(left: 10, right: 30),
        height: 35,
        child: TextField(
          enabled: false,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              //输入文字后面的小图标
              fillColor: Color(0xFFF5F5F5),
              filled: true,
              hintText: "搜索关键词",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              )),
        ),
      ),
      backgroundColor: Colors.white,
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
        return buildItemUI(_topArticles[index]);
      }, childCount: _topArticles.length),
    );
  }

  ///创建ListView列表
  Widget _buildArticleListUI() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return buildItemUI(_articles[index]);
      }, childCount: _articles.length),
    );
  }

  ///创建item项样式
  Widget buildItemUI(ArticleItem articleItem) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 5),
        child: InkWell(
          child: Row(
            children: [
              Icon(Icons.favorite_border),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///第一行 作者
                        Text(
                          articleItem.shareUser,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),

                        ///第一行 右侧 时间
                        Text(
                          articleItem.niceDate,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),

                    ///中间的标题
                    Text(articleItem.title,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.only(top: 5)),

                    ///底部的文章类型
                    Text(
                      "${articleItem.superChapterName}/${articleItem.chapterName}",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            Fluttertoast.showToast(
                msg: articleItem.title,
                textColor: Colors.white,
                backgroundColor: Colors.blue);
          },
        ));
  }
}

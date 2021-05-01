import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PersonViewModel(),
        ),
      ],
      child: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        child: CustomScrollView(
          slivers: [
            _buildTitleUI(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleUI() {
    return SliverAppBar(
      brightness: Brightness.dark,
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Image.network(
                "https://p5.ssl.qhimgs1.com/sdr/400__/t01c17aaee52c2cbcff.jpg",
                fit: BoxFit.cover,
                width: double.infinity),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: _buildPersonTop()
            )
          ],
        ),
      ),
      expandedHeight: 200.0,
    );
  }

  Widget _buildPersonTop() {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //头像
          SizedBox(
            width: 60,
            height: 60,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://p5.ssl.qhimgs1.com/sdr/400__/t01c17aaee52c2cbcff.jpg"),
            ),
          )
        ],
        
      ),
    );
  }
}

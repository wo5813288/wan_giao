import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android/bean/project_data.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/page/project/project_content_page.dart';
import 'package:wan_android/page/state_page.dart';
import 'package:wan_android/viewmodel/project_view_model.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ProjectTabData>(
      model: ProjectTabData(),
      onReadyMore: (model) {
        model.getProjectTabs();
      },
      builder: (context, model, child) {
        return DefaultTabController(
          length: model.projects.length,
          child: Builder(
            builder: (context) {
              _tabController = TabController(length: model.projects.length, vsync: this);
              return Scaffold(
                appBar: AppBar(
                  brightness: Brightness.dark,
                  title: Container(
                    width: double.infinity,
                    child: _buildProjectTabs(model.projects),
                  ),
                ),
                body:Builder(
                  builder: (context){
                    if (model.loadState == LoadState.EMPTY) {
                      return EmptyPage();
                    } else if (model.loadState == LoadState.FAILURE) {
                      return NetWorkErrorPage(onPressed: (){
                        model.getProjectTabs();
                      },);
                    }
                    return TabBarView(
                      controller: _tabController,
                      children: model.projects.map((e) {
                        return ProjectContentPage(e.id.toString());
                      }).toList(),
                    );
                  },
                )

              );
            },
          ),
        );
      },
    );
  }

  ///构建顶部的tbs
  Widget _buildProjectTabs(List<Project> projects) {
    return TabBar(
      isScrollable: true,
      controller: _tabController,
      tabs: projects.map((e) {
        return Tab(
          text: e.name,
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/project_data.dart';
import 'package:wan_android/controller/project_controller.dart';
import 'package:wan_android/page/project/project_content_page.dart';
import 'file:///D:/androidwork/wan_android_flutter/lib/compents/state_page.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return GetX<ProjectController>(
      init: Get.put<ProjectController>(ProjectController()),
      initState: (_){
        Get.find<ProjectController>().getProjectTabs();;
      },
      builder: (controller) {
        return DefaultTabController(
          length: controller.projects.length,
          child: Builder(
            builder: (context) {
              _tabController = TabController(length: controller.projects.length, vsync: this);
              return Scaffold(
                appBar: AppBar(
                  brightness: Brightness.dark,
                  title: Container(
                    width: double.infinity,
                    child: _buildProjectTabs(controller.projects),
                  ),
                ),
                body:Builder(
                  builder: (context){
                    if(controller.loadState.value==LoadState.LOADING){
                      return LoadingPage();
                    }
                    if (controller.loadState.value == LoadState.EMPTY) {
                      return EmptyPage();
                    } else if (controller.loadState.value == LoadState.FAILURE) {
                      return NetWorkErrorPage(onPressed: (){
                        controller.getProjectTabs();
                      },);
                    }
                    return TabBarView(
                      controller: _tabController,
                      children: controller.projects.map((e) {
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

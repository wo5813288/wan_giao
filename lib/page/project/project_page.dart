import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/bean/project_data.dart';
import 'package:wan_android/controller/project/project_controller.dart';
import 'package:wan_android/page/project/project_content_page.dart';
import 'package:wan_android/compents/state_page.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> with TickerProviderStateMixin {
  TabController _tabController;
  var _projectController = Get.put<ProjectController>(ProjectController());
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: _projectController.projects.length,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Container(
            width: double.infinity,
            child: Obx(()=>_buildProjectTabs(_projectController.projects)),
          ),
        ),
        body: GetX<ProjectController>(
          initState: (_){
            _projectController.getProjectTabs();
          },
          builder: (_){
            _tabController = TabController(length: _projectController.projects.length,vsync: this);
            return StateCommonPage<ProjectController>(
                model: _projectController,
                onPressed: (){
                  _projectController.getProjectTabs();
                },
                child:TabBarView(
                  controller: _tabController,
                  children: _projectController.projects.map((e) {
                    return ProjectContentPage(e.id.toString());
                  }).toList(),
                )
            );
          },
        ),
      ),
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

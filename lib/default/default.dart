

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/page/index_page.dart';

class MyApp extends StatelessWidget{
  final routers = {
    '/': (context) =>IndexPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routers,
    );
  }

}
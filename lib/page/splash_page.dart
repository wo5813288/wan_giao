import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/route/routes_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    //线性的放大动画
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    _animation = Tween(begin: 0.0,end:100.0).animate(_animationController)
    ..addListener(() {
      if(_animationController.isCompleted){
        Future.delayed(Duration(milliseconds: 500),(){
          Get.offNamed(RoutesConfig.MAIN);
        });
      }
      setState(() {});
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
            height: _animation.value,
            width: _animation.value,
            color: Colors.white,
            child: FlutterLogo(),
          )
      ),
    );
  }
}


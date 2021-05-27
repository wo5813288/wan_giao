import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android/route/routes_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _animation;
  bool isTimeCount = false;
  int timeCount = 10;
  Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        timeCount--;
        if(timeCount<=0){
          _jumpToMain();
        }
      });
    });
    //线性的放大动画
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    _animation = Tween(begin: 0.0,end:100.0).animate(_animationController)
    ..addListener(() {
      if(_animationController.isCompleted){
        isTimeCount = true;
      }
      setState(() {});
    });
    _animationController.forward();
  }

  void _jumpToMain(){
    _timer.cancel();
    Get.offNamed(RoutesConfig.MAIN);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child:Center(
                    child:  Container(
                      height: _animation.value,
                      width: _animation.value,
                      color: Colors.white,
                      child: FlutterLogo(),
                    ),
                  )
              ),
              isTimeCount?Positioned(
                  top: MediaQuery.of(context).padding.top+10,
                  right: 10,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(5.w),
                          child: Text("跳过(${timeCount}s)",style: TextStyle(color: Colors.white,fontSize:10.sp),),
                          color: Colors.black26.withOpacity(0.5),
                        ),
                        onTap: (){
                          _jumpToMain();
                        },
                      )
                  )
              ):Container()
            ],
          )
      ),
    );
  }
}


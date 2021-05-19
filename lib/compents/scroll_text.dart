import 'dart:async';

import 'package:flutter/material.dart';

class ScrollText extends StatefulWidget {
  final List<String> titles;
  final Duration duration;
  final double width;
  final double height;
  final double textSize;
  final Color textColor;
  ScrollText({Key key,@required this.titles,this.duration,this.width,this.height,this.textColor,this.textSize})
      :assert(titles!=null),super(key: key);
  @override
  _ScrollTextState createState() => _ScrollTextState();
}

class _ScrollTextState extends State<ScrollText> {
  double _width;
  ScrollController _scrollController;
  double _oldOffset;
  Duration _duration;
  Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _width = widget.width??double.infinity;
    _duration = widget.duration??Duration(seconds: 5);
    _oldOffset = 0.0;
    _scrollController = new ScrollController(initialScrollOffset: _oldOffset);
    _timer = Timer.periodic(_duration, (timer) {
      double max = _scrollController.position.maxScrollExtent;
      debugPrint("===>$max");
      if(max<=_width){
        _timer.cancel();
      }else{
        double newOffset = _oldOffset+100;
        if(newOffset!=_oldOffset){
          _oldOffset = newOffset;
          _scrollController.animateTo(_oldOffset, duration: _duration, curve: Curves.linear);
        }
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: widget.height??55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(right: 100),
            child: Row(
              children: widget.titles.map((e){
                return Text(
                    e
                );
              }).toList(),
            )
          );
        },
      ),
    );
  }
}

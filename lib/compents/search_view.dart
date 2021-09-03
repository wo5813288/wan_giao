import 'package:flutter/material.dart';
import 'package:wan_android/theme/app_color.dart';
import 'package:wan_android/theme/app_style.dart';

class SearchView extends StatefulWidget {
  //点击事件
  final GestureTapCallback onTap;
  final String queryHint;
  final double width;
  final Color backgroundColor;
  final Color queryHintColor;
  final bool enabled;
  final IconData suffixIcon;
  final VoidCallback onPressed;
  final TextEditingController textEditingController;

  //提交操作
  final ValueChanged<String> submit;
  final ValueChanged<String> changed;

  SearchView(
      {Key key,
      this.onTap,
      this.queryHint,
      this.width,
      this.backgroundColor,
      this.queryHintColor,
      this.submit,
      this.suffixIcon,
      this.onPressed,
      this.changed,
      this.textEditingController,
      this.enabled = false});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = widget.textEditingController;
    _textEditingController?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.grey),
      child: InkWell(
        child: TextField(
          onSubmitted: widget.submit,
          onChanged: widget.changed,
          enabled: widget.enabled,
          controller: _textEditingController,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,color: Colors.grey),
              //输入文字后面的小图标
              suffixIcon: _buildSuffixIcon(),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none),
              fillColor:
                  widget.backgroundColor ?? KColors.searchBackgroundColor,
              filled: true,
              contentPadding: EdgeInsets.all(0),
              hintText: widget.queryHint,
              hintStyle: kSearchHintTextStyle,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none)),
        ),
        onTap: widget.onTap,
      ),
    );
  }

  Widget _buildSuffixIcon() {
    if (_textEditingController == null ||
        _textEditingController.text.length <= 0) {
      return null;
    } else {
      return IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(widget.suffixIcon,color: Colors.grey,),
          onPressed: widget.onPressed);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileItem extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onTap;

  const ListTileItem({Key key, this.title, this.content="", this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Expanded(
          flex: 1,
          child: Text(
            content,
            style:Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 14.sp),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(width: 10.w,),
        Opacity(
          opacity: onTap == null ? 0 : 1,
          child: Icon(
            Icons.navigate_next_outlined,
            color: Colors.grey,
          ),
        )
      ],
    );

    child = Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.only(left: 10.w),
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 40.h),
        decoration: BoxDecoration(
            border:
                Border(bottom: Divider.createBorderSide(context, width: 0.6))),
        child: child);
    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}

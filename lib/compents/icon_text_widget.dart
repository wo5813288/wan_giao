import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final Widget widget;
  final GestureTapCallback onTap;
  final double mainAixSpacing;
  final Color iconColor;

  IconTextWidget(this.icon, this.widget,
      {this.onTap, this.mainAixSpacing = 0, this.iconColor});

  IconTextWidget.builder(this.icon, String label,
      {double labelSize,
      Color labelColor,
      this.onTap,
      this.mainAixSpacing,
      this.iconColor})
      : widget = Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            color: labelColor,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  InkWell(
        child: Column(
          children: [
            Icon(icon, color: iconColor ?? Theme.of(context).iconTheme.color),
            SizedBox(height: mainAixSpacing),
            widget,
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

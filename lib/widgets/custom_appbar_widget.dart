import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
final String? title;
final Color? bgColor;
final List<Widget>? actions;

CustomAppBar({
  Key?key,
  required this.title,
  this.actions,
  this.bgColor
});

  @override
  Size get preferredSize => Size.fromHeight(60);


@override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      title: Text(title!),
      elevation: 0,
      centerTitle: true,
      actions: actions,
    );
  }




}

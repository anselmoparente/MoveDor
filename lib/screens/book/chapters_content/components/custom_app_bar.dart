import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movedor/components/rounded_icon_btn.dart';
import 'package:movedor/models/Chapter.dart';

import '../../../../size_config.dart';


class CustomAppBar extends PreferredSize {
  final Chapter chapter;
  CustomAppBar(this.chapter);
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              iconData: Icon(LineIcons.arrowLeft, size: 18, color: Colors.black87),
              showShadow: true,
              press: () => Navigator.pop(context)
            ),
            RoundedIconBtn(
              iconData: Icon(LineIcons.shareSquare, size: 18, color: Colors.black87),
              showShadow: true,
              press: () => Navigator.pop(context)
            ),
          ]
        ),
      ),
    );
  }  
}
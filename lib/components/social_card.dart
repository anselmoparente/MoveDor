import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key key,
    this.icon,
    this.text,
    this.press,
  }) : super(key: key);

  final String icon;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
     return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: RaisedButton(
        elevation: 0,
        
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black87), borderRadius: BorderRadius.circular(25)),
        color: Colors.white,
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: getProportionateScreenWidth(10)),
            Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.black87,
              ),
            ),
          ],
        )
      ),
    );

  }
}

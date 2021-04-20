import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key key,
    this.press,
    @required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          0,
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(20),
        ),
        child: SvgPicture.asset(
          svgIcon,
          height: getProportionateScreenWidth(20),
        ),
      ),
    );
  }
}

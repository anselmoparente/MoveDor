import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'package:movedor/constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(25)),
      child: 
      Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [kPrimaryColor, kPrimaryLightColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,),
              // color: kPrimaryColor,
               borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(-3, 3),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: -2,
                )
              ],
            ),
            width: double.infinity,
            height: getProportionateScreenHeight(130),
          ),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(50)),
                    Text(
                      "Olá João,",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(30),
                          color: Colors.white,
                          height: 0.5),
                    ),
                    Text(
                      "Que bom te ver por aqui de novo!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                  ],
                ), 
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ],
      ),
    );
  }
}

class FilterBtn extends StatelessWidget {
  const FilterBtn({
    Key key,
    this.press
  }) : super(key: key);
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(-3, 3),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
            spreadRadius: -2,
          )
        ],
      ),
      child:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: FlatButton (
          color: Colors.white,
          onPressed: press,
          child: 
          Icon(
            Icons.filter_list,
            color: Colors.black.withOpacity(.5)
          ),
        ),
      )
    );
  }
}

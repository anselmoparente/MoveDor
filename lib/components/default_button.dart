import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.loading = false,
  }) : super(key: key);
  final String text;
  final Function press;
  final bool loading;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: loading ? null : press,
        padding: EdgeInsets.all(0.0),
        child: 
        loading ?
        CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        ) 
        :
        Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xff36a9b0), Color(0xffa9d6c2)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(25.0)
          ),
          child: Container(
            alignment: Alignment.center,
            child: 
            Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
              ),
            ),
          )
        ),
        
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movedor/components/rounded_icon_btn.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: 
        RoundedIconBtn(
          iconData: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black87),
          press: () => Navigator.pop(context)
        ),
      ),
      body: Body(),
    );
  }
}

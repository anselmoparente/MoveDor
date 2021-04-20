import 'package:flutter/material.dart';
import 'package:movedor/screens/splash/components/body.dart';
import 'package:movedor/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: Body(),
    );
  }
}

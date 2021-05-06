import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movedor/screens/sign_in/sign_in_screen.dart';
import 'package:movedor/screens/splash/components/body.dart';
import 'package:movedor/size_config.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 0), () => Navigator.pushNamed(context, SignInScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: Container(),
    );
  }
}

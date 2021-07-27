import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/book/book_screen.dart';
import 'package:movedor/screens/search/search_screen.dart';
import 'package:movedor/size_config.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);

    if (controller.searchComplete == true) {
      Timer(Duration(seconds: 0),
          () => Navigator.pushNamed(context, BookScreen.routeName));
    } else if (controller.searchComplete == false) {
      Timer(Duration(seconds: 0),
          () => Navigator.pushNamed(context, SearchScreen.routeName));
    }

    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: Container(),
    );
  }
}

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movedor/controllers/main_controller.dart';

import 'splash_screen.dart';

class SplashScreenInitial extends StatefulWidget {
  static String routeName = "/splash-initial";

  @override
  _SplashScreenInitialState createState() => _SplashScreenInitialState();
}

class _SplashScreenInitialState extends State<SplashScreenInitial> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String token;

  @override
  void initState() {
    super.initState();
    firebaseMessaging.getToken().then((value) {
      token = value;
      print('token: $token');
    });
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, SplashScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);

    Future.delayed(Duration(seconds: 1), () {
      controller.token = token;
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(247, 247, 247, 1)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/logo/logo_com_nome_ftransparente.png",
                        height: 250,
                        width: 235,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

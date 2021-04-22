import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'splash_screen.dart';

class SplashScreenInitial extends StatefulWidget {
  static String routeName = "/splash-initial";

  @override
  _SplashScreenInitialState createState() => _SplashScreenInitialState();
}

class _SplashScreenInitialState extends State<SplashScreenInitial> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, SplashScreen.routeName));
    Firebase.initializeApp().whenComplete(() {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      messaging.getToken().then((token) {
        print('Token: $token');
      }).catchError((e) {
        print('error' + e);
      });
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Message data: ${message.notification.title}');
      });

      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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

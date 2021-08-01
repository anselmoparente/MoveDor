import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/book/book_screen.dart';
import 'package:movedor/screens/search/search_screen.dart';
import 'package:movedor/size_config.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void sendNotification(String body, String title, String token) {
    String keyServer =
        "AAAAHpgTV48:APA91bHNSsnOeRgi3x8yeP7E_eqCEI0-3h2nrpEYaBdm6OglTtPczePKjS_mNXt10mAnWcPdN4EaHyVMc0j973ep29XHwoyvWU8AwlT5Mir5qp7VZHAk5RVntIwtDcHG-pzVdwefzPnQ";
    var data = {
      "notification": {"body": body, "title": title},
      "priority": "high",
      "data": {"click_action": "FLUTTER_NOTIFICATION_CLICK"},
      "to": token
    };
    var dataBody = json.encode(data);
    http.post("https://fcm.googleapis.com/fcm/send", body: dataBody, headers: {
      "Content-Type": "application/json",
      "Authorization": "key=$keyServer"
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);

    sendNotification('Teste', 'Testado com sucesso', controller.token);

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

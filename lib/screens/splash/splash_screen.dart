import 'dart:async';
import 'dart:convert';

import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:movedor/size_config.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/book/book_screen.dart';
import 'package:movedor/screens/search/search_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  void sendNotification(String body, String title, String token) async {
    String keyServer =
        "AAAAHpgTV48:APA91bGAfRl9WYJ65qCBgC6fIsTbLGMrhjVDtc6n8lIZl5boWLoAulNty2Twv5ydUzVm8RnUHbXmYjU-qiAJ6KP3EJ8bpO9E0lR3Yx_HD_5Nr3jfdA68uc13vVduk8OiFL_vaznwAqiS";
    var data = {
      "notification": {"body": body, "title": title},
      "priority": "high",
      "data": {"click_action": "FLUTTER_NOTIFICATION_CLICK"},
      "to": token,
    };
    var dataBody = json.encode(data);
    final test = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body: dataBody,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "key=$keyServer"
        });

    print(test.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);

    var cron = new Cron();
    cron.schedule(new Schedule.parse('* 1 * * *'), () async {
      print('vai enviar?');
      sendNotification('Teste', 'Testado com sucesso', controller.token);
      print('enviouuuu');
    });

    if (controller.searchComplete == true) {
      Timer(Duration(seconds: 0), () {
        Navigator.pushNamed(context, BookScreen.routeName);
      });
    } else if (controller.searchComplete == false) {
      Timer(Duration(seconds: 0), () {
        Navigator.pushNamed(context, SearchScreen.routeName);
      });
    }

    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: Container(),
    );
  }
}

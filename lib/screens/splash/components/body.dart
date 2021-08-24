import 'dart:convert';

import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:movedor/constants.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/book/book_screen.dart';
import 'package:movedor/screens/search/search_screen.dart';
import 'package:movedor/size_config.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Entenda o que você está passando",
      "image": "assets/caps_illustrations/cap2-01.png"
    },
    {
      "text": "Saiba como tratar!",
      "image": "assets/caps_illustrations/cap5-01.png"
    },
    {
      "text": "Vamos lá?",
      "image": "assets/caps_illustrations/cap6_illustration.png"
    },
  ];

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
    final test = await http.post("https://fcm.googleapis.com/fcm/send",
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
    
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/logo/logo_com_nome_ftransparente.png",
                height: getProportionateScreenHeight(130),
                width: getProportionateScreenWidth(115),
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Entrar",
                      press: () {
                        if (controller.searchComplete == true) {
                          Navigator.pushNamed(context, BookScreen.routeName);
                        } else if (controller.searchComplete == false) {
                          Navigator.pushNamed(context, SearchScreen.routeName);
                        }
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

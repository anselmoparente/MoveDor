import 'dart:convert';
import 'dart:math';

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
  bool loading = false;
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

  List<String> reminderList = [
    'Que tal praticar sua atividade física agora?',
    "Está na hora do seu melhor remédio: a atividade física!",
    "Olá! Que tal se exercitar agora?",
    "Oi, tá aí? 👀 Que tal fazer aquele exercício físico agora?",
    "⏰Chegou a melhor hora do dia! Hora do exercício! ⏰",
    "Repita comigo: hoje eu vou me exercitar!",
    "🏃E aí, qual é a boa de hoje? Caminhada, corrida... Pode escolher, o importante é se movimentar!",
    "Sabe o que vai cair bem hoje? Praticar atividade física!",
    "Você já praticou o seu exercício de hoje?",
    "Adivinha só? Hora do exercício!",
    "Sabe qual é o melhor exercício? Aquele que você sente prazer em praticar!",
    "🙋‍♂️🙋 Levanta a mão quem vai fazer atividade física agora!",
    "Hora de calçar o tênis e cuidar da coluna e da mente!",
    "😍 Lembrei de você! Que tal praticar atividade física agora?",
    "Oi, lembra de mim? Está na hora do exercício!",
    "😄 A minha cara quando lembro que está na hota do exercício!",
    "Faça sol 🌞 ou faça chuva 🌧, toda hora é hora de cuidar da saúde!",
    "⏰ Hora do exercício! ⏰",
    "Que tal deixar o dia mais especial fazendo aquele exercício? 😉",
    "A notificação mais esperada por você chegou! Vem cuidar da sua saúde!",
    "Nada melhor que estar em dia com a sua saúde!",
    "Olá! Chegou a hora de fazer o seu exercício!",
    "Vamos nos exercitar? Que tal começar agora?",
    "Mais um dia, mais uma oportunidade de realizar os seus objetivos! Vamos nos exercitar?",
    "Que tal melhorar a sua saúde agora? Vamos nos exercitar!",
    "O exercício físico é o melhor aliado para quem tem dor lombar!",
    "Estamos amando acompanhar você! Vamos praticar mais exercícios?",
    'Nada melhor que manter a saúde e ainda ficar de bom humor, né? Com o exercício você consegue!',
    'Não esqueça a sua atividade física de hoje, ok? 😉',
    'Passando aqui para te lembrar do nosso compromisso com a sua saúde de hoje! 😉'
  ];

  List<String> reminderDay = [
    'Você sabia? O melhor remédio para a dor lombar é a atividade física!',
    "Ter uma vida saudável tráz diversos benefícios para o nosso corpo e mente!",
    "Passando para lembrar que você é capaz de realizar os seus objetivos!",
    "Você sabia que uma alimentação saudável pode reduzir o seu estresse e dor?",
    "Reduz o estresse, aumenta nossa felicidade, reduz a dor... Essa é a atividade física!",
    "Exercícios de respiração e relaxamento podem lhe ajudar a lidar melhor com a dor lombar!",
    "A dor lombar crônica na maioria das vezes NÃO é uma condição grave! E você pode lidar com ela!",
    "A caminhada é um exercício simples, gratuito e ótima para a dor lombar!",
    "Sim, é seguro se movimentar! Continue com as suas atividades!",
    "O melhor exercício é aquele que você gosta!",
    "Um passo à frente e você não estará mais no mesmo lugar!",
    "Você sabia que a dor lombar é muito comum? Continue com suas atividade de trabalho.",
    "Ficar apenas em repouso ou receber tratamentos passivos não irá melhorar a sua dor!",
    "Como um remédio, o exercício físico deve ser na dose certa! Você pode achar a sua dose ideal praticando!",
    "Em episódios de crise, não use remédios por conta própria, somente aqueles que foram passados pelo seu médico!",
    "Posso me movimentar mesmo com dor? SIMMMMMMMMMM!",
    "Você sabia que a atividade física melhora a nossa circulação?",
    "Que tal revisar os conceitos sobre Dor Lombar no nosso app?",
    "Acha que sabe tudo sobre dor lombar? Faça agora o nosso quiz e descubra!",
    "Permanecer realizando atividade doméstica, de trabalho e de laser é a melhor maneira de lidar com a dor lombar.",
    "Você sabia? Ficar parado é o pior a se fazer para quem tem dor crônica!",
    "Teste agora os seus conhecimentos sobre dor lombar no nosso quiz!",
    "Permaneça em movimento!",
    "Monitore as suas atividades físicas com a ajuda do nosso app e perceba a sua evolução.",
    "Quer aprender mais sobre dor lombar? Clique aqui!",
    "Você sabia que a prática do exercício contribui para a qualidade de vida?",
    "E aí, como anda a sua lombar? Vem contar pra gente!",
    'E aí, aprendeu tudo sobre dor lombar? Vem testar seus conhecimentos no nosso quiz!',
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
    cron.schedule(new Schedule.parse('0 10 * * 1,3,5'), () async {
      var rng = new Random();
      String frase = reminderList[rng.nextInt(reminderList.length)];
      sendNotification('MoveDor', frase, controller.token);
    });
    cron.schedule(new Schedule.parse('0 13 * * *'), () async {
      var rng = new Random();
      String frase = reminderDay[rng.nextInt(reminderDay.length)];
      sendNotification('MoveDor', frase, controller.token);
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
                      loading: loading,
                      press: () {
                        print(controller.searchComplete);
                        loginAction(controller);
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

  Future loginAction(MainController controller) async {
    setState(() {
      loading = true;
    });
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    if (controller.searchComplete == true) {
      Navigator.pushNamed(context, BookScreen.routeName);
    } else if (controller.searchComplete == false) {
      Navigator.pushNamed(context, SearchScreen.routeName);
    }
  }
}

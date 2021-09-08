import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:movedor/controllers/diary_controller.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/diary/calendar_page.dart';
import 'package:provider/provider.dart';

class StartBackPage extends StatefulWidget {
  @override
  _StartBackPageState createState() => _StartBackPageState();
}

class _StartBackPageState extends State<StartBackPage> {
  double fontSize = 18;

  final _form = GlobalKey<FormState>();
  Map<String, dynamic> startBackFrases = {
    'A minha dor nas costas se espalhou pelas pernas nas duas últimas semanas.':
        false,
    'Eu tive dor no ombro e/ou pelo menos uma vez nas duas últimas semanas.':
        false,
    'Eu evito andar longas distâncias por causa da minha dor nas costas.':
        false,
    'Nas duas últimas semanas, tenho me vestido mais devagar por causa da minha dor nas costas.':
        false,
    'A atividade física não é realmente segura para uma pessoa com um problema como o meu.':
        false,
    'Tenho ficado preocupado por muito tempo por causa da minha da minha dor nas costas.':
        false,
    'Eu sinto que minha dor nas costas é terrível e que nunca vai melhorar':
        false,
    'Em geral, eu não tenho gostado de todas as coisas como eu costumava gostar.':
        false,
  };
  List startBackSelectedFrases = [];
  String startBackSliderLabel = 'Nada';
  double startBackSliderValue = 0.0;
  int startBackPoints = 0;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);
    final diaryController = Provider.of<DiaryController>(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      'Pensando nas duas últimas semanas, marque as frases que você se identifica ao ler.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black54,
                        fontSize: fontSize.toDouble() + 6,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(top: 25),
                  ),
                  Container(
                    child: Column(
                      children: startBackFrases.keys.map((String key) {
                        return new CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFF36a9b0),
                          title: new Text(
                            key,
                            style: TextStyle(
                              fontFamily: 'MontserratRegular',
                              color: Colors.black54,
                              fontSize: fontSize.toDouble(),
                            ),
                          ),
                          value: startBackFrases[key],
                          onChanged: (bool value) {
                            if (value) {
                              setState(() {
                                startBackSelectedFrases.add(key);
                                startBackPoints += 1;
                              });
                            } else {
                              setState(() {
                                startBackSelectedFrases.remove(key);
                                startBackPoints -= 1;
                              });
                            }
                            setState(() {
                              startBackFrases[key] = value;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      'Em geral, quanto a sua dor nas costas o incomodou nas duas últimas semanas?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black54,
                        fontSize: fontSize.toDouble() + 6,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(top: 25),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Slider(
                          value: startBackSliderValue,
                          max: 4.0,
                          min: 0.0,
                          divisions: 4,
                          label: startBackSliderLabel,
                          inactiveColor: Colors.green[50],
                          activeColor: startBackSliderValue.toInt() > 3
                              ? Colors.red
                              : startBackSliderValue.toInt() < 2
                                  ? Colors.green
                                  : Colors.red[300],
                          onChanged: (double value) {
                            setState(() {
                              value == 0
                                  ? startBackSliderLabel = 'Nada'
                                  : value == 1
                                      ? startBackSliderLabel = 'Pouco'
                                      : value == 2
                                          ? startBackSliderLabel = 'Moderado'
                                          : value == 3
                                              ? startBackSliderLabel = 'Muito'
                                              : startBackSliderLabel =
                                                  'Extremamente';

                              startBackSliderValue = value;
                            });
                          })),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(top: 25),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 80),
                      child: RaisedButton(
                        onPressed: () async {
                          setState(() {
                            if (startBackSliderValue >= 3) {
                              startBackPoints += 1;
                            }
                          });
                          await FirebaseFirestore.instance
                              .collection('users_v2')
                              .doc(controller.id)
                              .collection('start_backs')
                              .doc()
                              .set({
                            'date': DateTime.now(),
                            'answer': startBackFrases,
                            'points': startBackPoints,
                            'answer_slider': {
                              'Em geral, quanto a sua dor nas costas o incomodou nas duas últimas semanas?':
                                  startBackSliderLabel
                            }
                          });

                          var date = DateTime.now();

                          String day = date.day.toString();

                          var cron = new Cron();
                          cron.schedule(new Schedule.parse('0 10 $day * *'),
                              () async {
                            diaryController.configuredDiary = false;
                            await FirebaseFirestore.instance
                                .collection('users_v2')
                                .doc(controller.id)
                                .update({
                              'configured_diary':
                                  diaryController.configuredDiary
                            });
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CalendarPage()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff36a9b0), Color(0xffa9d6c2)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Continuar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'MontserratRegular',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

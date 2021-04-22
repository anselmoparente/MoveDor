import 'package:flutter/material.dart';
import 'package:movedor/screens/diary/activity_time_page.dart';

class Diary extends StatefulWidget {
  Diary({Key key}) : super(key: key);

  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  Size mediaSize;
  bool aux = false;
  List<dynamic> exercises = [
    'Exercícios aeróbios(caminhada, corrida, bicicleta)',
    'Exercícios de fortalecimento(musculação, ginástica, funcional)',
    'Exercícios ou técnicas de relaxamento(exercícios respiratórios, meditação, alongamento)',
    'Exercícios na água(hidroginástica, natação, caminhada na água, fisioterapia aquática)',
    'Ioga e Thai chi chuan',
    'Dança'
  ];
  List<bool> boolExercises = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      'Seja bem vindo ao Diário de atividade física do MoveDor!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xff36a9b0),
                        fontSize: mediaSize.width * 0.07,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      'Informe abaixo qual (ou quais) atividades físicas você pretende realizar:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MontserratRegular',
                        color: Color(0xff36a9b0),
                        fontSize: mediaSize.width * 0.06,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(top: 25),
                  ),
                  Container(
                    child: Column(
                      children: [
                        componentForms(context, 0,
                            'Exercícios aeróbios(caminhada, corrida,\n bicicleta)'),
                        componentForms(context, 1,
                            'Exercícios de fortalecimento(musculação,\n ginástica, funcional)'),
                        componentForms(context, 2,
                            'Exercícios ou técnicas de relaxamento \n(exercícios respiratórios, meditação,\n alongamento)'),
                        componentForms(context, 3,
                            'Exercícios na água(hidroginástica, natação,\n caminhada na água, fisioterapia aquática)'),
                        componentForms(context, 4, 'Ioga e Thai chi chuan'),
                        componentForms(context, 5, 'Dança'),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: mediaSize.height * 0.05),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ActivityTimePage()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffa9d6c2), Color(0xff36a9b0)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Avançar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                fontSize: mediaSize.width * 0.09,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaSize.height * 0.05,
                  )
                ],
              )),
            ],
          ),
        ));
  }

  Widget componentForms(BuildContext context, int index, String label) {
    bool aux2 = boolExercises[index];
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Color(0xff36a9b0)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: aux != aux2
                  ? Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffa9d6c2), Color(0xff36a9b0)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ))
                  : Container(
                      height: 30,
                      width: 30,
                    ),
            ),
            onTap: () {
              setState(() {
                if (boolExercises[index] == true) {
                  boolExercises[index] = false;
                } else if (boolExercises[index] == false) {
                  boolExercises[index] = true;
                }
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(
                left: mediaSize.width * 0.03, top: mediaSize.height * 0.007),
            child: Text(
              label,
              style: TextStyle(
                fontSize: mediaSize.width * 0.035,
                color: Color(0xff36a9b0),
              ),
            ),
          )
        ],
      ),
    );
  }
}

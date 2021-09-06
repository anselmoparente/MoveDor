import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../chapter02.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/controllers/search_controller.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController _scrollController = new ScrollController();

  Map<String, bool> frases = {
    'Fico em casa a maior parte do tempo por causa de minhas costas.': false,
    'Mudo de posição frequentemente tentando deixar minhas costas confortáveis.':
        false,
    'Ando mais devagar que o habitual por causa de minhas costas.': false,
    'Por causa de minhas costas, eu não estou fazendo nenhum dos meus trabalhos que geralmente faço em casa.':
        false,
    'Por causa de minhas costas, eu uso o corrimão para subir escadas.': false,
    'Por causa de minhas costas, eu me deito para descansar mais frequentemente.':
        false,
    'Por causa de minhas costas, eu tenho que me apoiar em alguma coisa para me levantar de uma cadeira normal.':
        false,
    'Por causa de minhas costas, tento conseguir com que outras pessoas façam as coisas para mim.':
        false,
    'Eu me visto mais lentamente que o habitual por causa de minhas costas.':
        false,
    'Eu somente fico em pé por períodos curtos de tempo por causa de minhas costas.':
        false,
    'Por causa de minhas costas, evito me abaixar ou me ajoelhar.': false,
    'Encontro dificuldades em me levantar de uma cadeira por causa de minhas costas.':
        false,
    'As minhas costas doem quase o tempo todo.': false,
    'Tenho dificuldade em me virar na cama por causa de minhas costas.': false,
    'Meu apetite não é muito bom por causa das dores em minhas costas.': false,
    'Tenho problemas para colocar minhas meias (ou meia-calça) por causa das dores em minhas costas.':
        false,
    'Caminho apenas curtas distâncias por causa de minhas dores nas costas.':
        false,
    'Não durmo tão bem por causa de minhas costas.': false,
    'Por causa de minhas dores nas costas, eu me visto com ajuda de outras pessoas.':
        false,
    'Fico sentado a maior parte do dia por causa de minhas costas.': false,
    'Evito trabalhos pesados em casa por causa de minhas costas.': false,
    'Por causa das dores em minhas costas, fico mais irritado e mal humorado com as pessoas que o habitual.':
        false,
    'Por causa de minhas costas, eu subo escadas mais vagarosamente do que o habitual.':
        false,
    'Fico na cama a maior parte do tempo por causa de minhas costas.': false,
  };
  List<String> frasesText = [
    'Fico em casa a maior parte do tempo por causa de minhas costas.',
    'Mudo de posição frequentemente tentando deixar minhas costas confortáveis.',
    'Ando mais devagar que o habitual por causa de minhas costas.',
    'Por causa de minhas costas, eu não estou fazendo nenhum dos meus trabalhos que geralmente faço em casa.',
    'Por causa de minhas costas, eu uso o corrimão para subir escadas.',
    'Por causa de minhas costas, eu me deito para descansar mais frequentemente.',
    'Por causa de minhas costas, eu tenho que me apoiar em alguma coisa para me levantar de uma cadeira normal.',
    'Por causa de minhas costas, tento conseguir com que outras pessoas façam as coisas para mim.',
    'Eu me visto mais lentamente que o habitual por causa de minhas costas.',
    'Eu somente fico em pé por períodos curtos de tempo por causa de minhas costas.',
    'Por causa de minhas costas, evito me abaixar ou me ajoelhar.',
    'Encontro dificuldades em me levantar de uma cadeira por causa de minhas costas.',
    'As minhas costas doem quase o tempo todo.',
    'Tenho dificuldade em me virar na cama por causa de minhas costas.',
    'Meu apetite não é muito bom por causa das dores em minhas costas.',
    'Tenho problemas para colocar minhas meias (ou meia-calça) por causa das dores em minhas costas.',
    'Caminho apenas curtas distâncias por causa de minhas dores nas costas.',
    'Não durmo tão bem por causa de minhas costas.',
    'Por causa de minhas dores nas costas, eu me visto com ajuda de outras pessoas.',
    'Fico sentado a maior parte do dia por causa de minhas costas.',
    'Evito trabalhos pesados em casa por causa de minhas costas.',
    'Por causa das dores em minhas costas, fico mais irritado e mal humorado com as pessoas que o habitual.',
    'Por causa de minhas costas, eu subo escadas mais vagarosamente do que o habitual.',
    'Fico na cama a maior parte do tempo por causa de minhas costas.',
  ];
  List<bool> frasesRespostas = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List selectedFrases = [];

  int currentFormIndex = 0;
  Size mediaSize;
  bool aux;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    final controller = Provider.of<MainController>(context);
    final searchController = Provider.of<SearchController>(context);

    List<Widget> formsPesquisas = [
      Container(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: mediaSize.height * 0.04,
                        left: mediaSize.width * 0.12),
                    child: Text(
                        "Você faz uso de algum medicamento para dor lombar?",
                        style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Color(0xff36a9b0),
                          fontSize: mediaSize.width * 0.07,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: mediaSize.width * 0.35,
                        top: mediaSize.height * 0.03),
                    child: Column(
                      children: [
                        componentUseMedication(
                            context, "Sim", true, searchController),
                        componentUseMedication(
                            context, "Não", false, searchController),
                      ],
                    ),
                  ),
                  aux == true
                      ? Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: mediaSize.height * 0.05),
                              child: Text(
                                'Qual a frequência que você \n utiliza esses medicamentos?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'MontserratRegular',
                                  color: Colors.black54,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            componentFormMedication(
                                context, 'Todo dia', searchController),
                            componentFormMedication(context,
                                '2 ou 3 vezes na semana', searchController),
                            componentFormMedication(
                                context, '1 vez na semana', searchController),
                            componentFormMedication(
                                context, '2 vezes ao mês', searchController),
                            componentFormMedication(
                                context, '1 vez ao mês', searchController),
                          ],
                        )
                      : Container(),
                  Container(
                    margin: EdgeInsets.only(top: mediaSize.height * 0.05),
                    child: ElevatedButton(
                      onPressed: () {
                        _scrollController.animateTo(
                          0.0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                        setState(() {
                          currentFormIndex = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.all(0.0),
                      ),
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
                            "Continuar",
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
                ],
              ),
            ),
          ),
        ),
      ),
      Container(
        child: Column(
          children: [
            Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    'Marque as frases que você se identifica ao ler.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: Color(0xff36a9b0),
                      fontSize: mediaSize.width * 0.07,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(top: 25),
                ),
                Container(
                  child: Column(
                    children: frases.keys.map((String key) {
                      return new CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Color(0xFF36a9b0),
                        title: new Text(
                          key,
                          style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: Color(0xff36a9b0),
                            fontSize: 16,
                          ),
                        ),
                        value: frases[key],
                        onChanged: (bool value) {
                          if (value) {
                            setState(() {
                              selectedFrases.add(key);
                            });
                          } else {
                            setState(() {
                              selectedFrases.remove(key);
                            });
                          }
                          setState(() {
                            frases[key] = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            )),
            Container(
              margin: EdgeInsets.only(top: mediaSize.height * 0.05),
              child: ElevatedButton(
                onPressed: () {
                  _scrollController.animateTo(
                    0.0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );
                  setState(() {
                    currentFormIndex = 2;
                  });
                  controller.finishedQuestions = true;

                  FirebaseFirestore.instance
                      .collection('users_v2')
                      .doc(controller.id)
                      .update({
                    'book': {
                      'last_chapter': controller.lastChapter,
                      'questions': controller.finishedQuestions,
                      'quiz': controller.finishedQuiz
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: EdgeInsets.all(0.0),
                ),
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
                      "CONTINUAR",
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
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 40),
                width: MediaQuery.of(context).size.width * 0.8,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: 30),
                    children: <TextSpan>[
                      new TextSpan(text: 'Muito obrigado, Anselmo'),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'Agora você pode continuar e usar o nosso app! :)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: Colors.black54,
                      fontSize: 25),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    for (int i = 0; i < selectedFrases.length; i++) {
                      String text = selectedFrases[i];
                      int index = frasesText.indexOf(text);
                      if (frasesRespostas[index] == false) {
                        frasesRespostas.removeAt(index);
                        frasesRespostas.insert(index, true);
                      } else if (frasesRespostas[index] == true) {
                        frasesRespostas.removeAt(index);
                        frasesRespostas.insert(index, false);
                      }
                    }
                    FirebaseFirestore.instance
                        .collection('users_v2')
                        .doc(controller.id)
                        .update({
                      'search': {
                        'search_complete': controller.searchComplete,
                        'activities_performed': searchController.selectedSports,
                        'disease': searchController.selectedSintoms,
                        'medication': {
                          'frequency': searchController.timeMedication,
                          'use': searchController.medication,
                        },
                        'pain': {
                          'back_pain': searchController.feelPain,
                          'scale_pain': searchController.painScale,
                          'time_scale': searchController.timeDor,
                          'under_region': searchController.painInf,
                        },
                        'own_back': {
                          'Dor nas costas significa que você lesionou suas costas':
                              searchController.question3,
                          'Existe uma grande chance de que um episódio de dor nas costas não se resolverá':
                              searchController.question10,
                          'Focar em outras coisas que não sejam as suas costas ajuda você a recuperar-se da dor nas costas':
                              searchController.question7,
                          'Se você não for cuidadoso, você pode machucar suas costas':
                              searchController.question2,
                          'Se você tem dor nas costas, você deve evitar exercícios físicos':
                              searchController.question5,
                          'Se você tem dor nas costas, você deveria tentar se manter ativo':
                              searchController.question6,
                          'Ter a expectativa de que sua dor nas costas vai melhorar, ajuda você à recuperar-se de dor nas costas':
                              searchController.question8,
                          'Uma vez que você tenha tido dor nas costas, sempre existirá uma fraqueza':
                              searchController.question9,
                          'Uma “fisgadinha” nas costas pode ser o primeiro sinal de uma lesão séria':
                              searchController.question4,
                          'É fácil de machucar as suas costas':
                              searchController.question1,
                        },
                        'rolland_morris': [
                          {
                            'answer': frasesRespostas[0],
                            'order': 1,
                            'text':
                                'Fico em casa a maior parte do tempo por causa de minhas costas'
                          },
                          {
                            'answer': frasesRespostas[1],
                            'order': 2,
                            'text':
                                'Mudo de posição frequentemente tentando deixar minhas costas confortáveis'
                          },
                          {
                            'answer': frasesRespostas[2],
                            'order': 3,
                            'text':
                                'Ando mais devagar que o habitual por causa de minhas costas'
                          },
                          {
                            'answer': frasesRespostas[3],
                            'order': 4,
                            'text':
                                'Por causa de minhas costas, eu não estou fazendo nenhum dos meus trabalhos que geralmente faço em casa'
                          },
                          {
                            'answer': frasesRespostas[4],
                            'order': 5,
                            'text':
                                'Por causa de minhas costas, eu uso o corrimão para subir escadas'
                          },
                          {
                            'answer': frasesRespostas[5],
                            'order': 6,
                            'text':
                                'Por causa de minhas costas, eu me deito para descansar mais frequentemente'
                          },
                          {
                            'answer': frasesRespostas[6],
                            'order': 7,
                            'text':
                                'Por causa de minhas costas, eu tenho que me apoiar em alguma coisa para me levantar de uma cadeira normal'
                          },
                          {
                            'answer': frasesRespostas[7],
                            'order': 8,
                            'text':
                                'Por causa de minhas costas, tento conseguir com que outras pessoas façam as coisas para mim'
                          },
                          {
                            'answer': frasesRespostas[8],
                            'order': 9,
                            'text':
                                'Eu me visto mais lentamente que o habitual por causa de minhas costas'
                          },
                          {
                            'answer': frasesRespostas[9],
                            'order': 10,
                            'text':
                                'Eu somente fico em pé por períodos curtos de tempo por causa de minhas costas'
                          },
                          {
                            'answer': frasesRespostas[10],
                            'order': 11,
                            'text':
                                'Por causa de minhas costas, evito me abaixar ou me ajoelhar'
                          },
                          {
                            'answer': frasesRespostas[11],
                            'order': 12,
                            'text':
                                'Encontro dificuldades em me levantar de uma cadeira por causa de minhas costas'
                          },
                          {
                            'answer': frasesRespostas[12],
                            'order': 13,
                            'text': 'As minhas costas doem quase o tempo todo'
                          },
                          {
                            'answer': frasesRespostas[13],
                            'order': 14,
                            'text':
                                'Tenho dificuldade em me virar na cama por causa de minhas costas'
                          },
                          {
                            'answer': frasesRespostas[14],
                            'order': 15,
                            'text':
                                'Meu apetite não é muito bom por causa das dores em minhas costas'
                          },
                          {
                            'answer': frasesRespostas[15],
                            'order': 16,
                            'text':
                                'Tenho problemas para colocar minhas meias (ou meia-calça) por causa das dores em minhas costas'
                          },
                          {
                            'answer': frasesRespostas[16],
                            'order': 17,
                            'text':
                                'Caminho apenas curtas distâncias por causa de minhas dores nas costas'
                          },
                          {
                            'answer': frasesRespostas[17],
                            'order': 18,
                            'text':
                                'Não durmo tão bem por causa de minhas costas'
                          },
                          {
                            'answer': frasesRespostas[18],
                            'order': 19,
                            'text':
                                'Por causa de minhas dores nas costas, eu me visto com ajuda de outras pessoas'
                          },
                          {
                            'answer': frasesRespostas[19],
                            'order': 20,
                            'text':
                                'Fico sentado a maior parte do dia por causa de minhas costas'
                          },
                          {
                            'answer': frasesRespostas[20],
                            'order': 21,
                            'text':
                                'Evito trabalhos pesados em casa por causa de minhas costas'
                          },
                          {
                            'answer': frasesRespostas[21],
                            'order': 22,
                            'text':
                                'Por causa das dores em minhas costas, fico mais irritado e mal humorado com as pessoas que o habitual'
                          },
                          {
                            'answer': frasesRespostas[22],
                            'order': 23,
                            'text':
                                'Por causa de minhas costas, eu subo escadas mais vagarosamente do que o habitual'
                          },
                          {
                            'answer': frasesRespostas[23],
                            'order': 24,
                            'text':
                                'Fico na cama a maior parte do tempo por causa de minhas costas'
                          },
                        ]
                      }
                    });

                    Navigator.pushNamedAndRemoveUntil(
                        context, Chapter02.routeName, (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(0.0),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff36a9b0), Color(0xffa9d6c2)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Vamos lá",
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
            ]),
      ),
    ];

    return ListView(controller: _scrollController, shrinkWrap: true, children: [
      currentFormIndex == 0
          ? formsPesquisas[0]
          : currentFormIndex == 1
              ? formsPesquisas[1]
              : formsPesquisas[2]
    ]);
  }

  componentFormMedication(
      BuildContext context, String label, SearchController searchController) {
    return Container(
      child: Row(
        children: [
          Observer(
            builder: (_) {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 50, top: 10),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.blue[200]),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: searchController.timeMedication == label
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
                    searchController.changedTimeMedication(label);
                  });
                },
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(left: mediaSize.width * 0.03),
            child: Text(label,
                style: TextStyle(
                  fontSize: mediaSize.width * 0.05,
                  color: Colors.black54,
                )),
          )
        ],
      ),
    );
  }

  Widget componentUseMedication(BuildContext context, String label, bool value,
      SearchController searchController) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Color(0xff36a9b0)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: searchController.medication == value
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
                searchController.changedMedication(value);
                aux = searchController.medication;
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(
                left: mediaSize.width * 0.03, top: mediaSize.height * 0.007),
            child: Text(label,
                style: TextStyle(
                  fontSize: mediaSize.width * 0.05,
                  color: Color(0xff36a9b0),
                )),
          )
        ],
      ),
    );
  }
}

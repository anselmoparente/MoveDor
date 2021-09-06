import 'package:flutter/material.dart';
import 'package:movedor/screens/book/book_screen.dart';
import 'package:page_slider/page_slider.dart';
import 'package:provider/provider.dart';
import 'package:rich_alert/rich_alert.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Chapter05Quiz extends StatefulWidget {
  static String routeName = "/chapter-05";
  @override
  State createState() => new Chapter05QuizState();
}

class Chapter05QuizState extends State<Chapter05Quiz> {
  @override
  void initState() {
    super.initState();
  }

  int currentStep = 0;

  bool complete = false;
  bool lastPage = false;
  bool firstPage = true;
  bool isLoading = false;
  bool hasUnansweredQuestions = false;
  bool showResponseAlert = false;

  List<Widget> questoes = [];
  List<Map> answersControllers = [];

  GlobalKey<PageSliderState> _slider = GlobalKey();

  createQuestions(BuildContext ctx) {
    // ==== 1a Questão =====
    answersControllers.add({
      "questao_id": 0,
      "answered": false,
      "correct_answer": false,
      "item_check": 0
    });
    questoes.add(new Questao(
      index: 0,
      answerController: answersControllers[0],
      questao: {
        'enunciado':
            'Exames de imagem (ressonância magnética, por exemplo) devem ser solicitados  para a maioria das pessoas com Dor Lombar Crônica?',
        'correct': 0,
        'its_true': false,
        'check_yes': false,
        'check_no': false,
        'msg':
            'A maioria das pessoas com Dor Lombar Crônica não precisa de exames de imagem para definir um tratamento ou desfecho. É comum ter degenerações ou lesões nos tecidos do corpo e não sentir dor. Portanto, não é possível afirmar que a hérnia de disco encontrada no exame é a causa da sua dor nas costas, a não ser que você possua sintomas como febre, perda de peso não intencional, diminuição de força muscular nas pernas, perda de sensibilidade progressiva, dores constantes, ou tenha passado por eventos traumáticos graves'
      },
      onValueChange: _onValueChange,
    ));
    // =====================

    // ==== 2a Questão =====
    answersControllers.add({
      "questao_id": 1,
      "answered": false,
      "correct_answer": false,
      "item_check": 0
    });
    questoes.add(new Questao(
      index: 1,
      answerController: answersControllers[1],
      questao: {
        'enunciado': 'A Dor Lombar Crônica é uma condição grave de saúde?',
        'correct': 0,
        'its_true': false,
        'check_yes': false,
        'check_no': false,
        'msg':
            'Na grande maioria dos casos, a DL não é uma condição grave de saúde. Procure sua equipe de saúde para uma melhor avaliação caso identifique: febre, perda de peso não intencional, diminuição de força muscular nas pernas, perda de sensibilidade progressiva, dores constantes, ou tenha passado por eventos traumáticos graves. Saiba que estes sinais são raros!',
      },
      onValueChange: _onValueChange,
    ));
    // =====================

    // ==== 3a Questão =====
    answersControllers.add({
      "questao_id": 2,
      "answered": false,
      "correct_answer": false,
      "item_check": 0
    });
    questoes.add(new Questao(
      index: 2,
      answerController: answersControllers[2],
      questao: {
        'enunciado': 'A Dor Lombar é uma queixa comum na população?',
        'correct': 0,
        'its_true': true,
        'check_yes': false,
        'check_no': false,
        'msg':
            'A dor lombar é uma queixa comum! Em torno de 84% da população brasileira irá sentir a DL em algum momento da vida.',
      },
      onValueChange: _onValueChange,
    ));
    // =====================

    // ==== 4a Questão =====
    answersControllers.add({
      "questao_id": 3,
      "answered": false,
      "correct_answer": false,
      "item_check": 0
    });
    questoes.add(new Questao(
      index: 3,
      answerController: answersControllers[2],
      questao: {
        'enunciado':
            'Sentir dor nas costas durante um exercício é normal, contanto que ela não aumente ou continue depois da atividade?',
        'correct': 0,
        'its_true': true,
        'check_yes': false,
        'check_no': false,
        'msg':
            'A dor pode acontecer durante a atividade, mas não deve se manter nem aumentar após sua conclusão. Ao se sentir seguro, progrida aos poucos, até ganhar confiança para fazer o movimento livremente.',
      },
      onValueChange: _onValueChange,
    ));
    // =====================

    // ==== 5a Questão =====
    answersControllers.add({
      "questao_id": 4,
      "answered": false,
      "correct_answer": false,
      "item_check": 0
    });
    questoes.add(new Questao(
      index: 4,
      answerController: answersControllers[3],
      questao: {
        'enunciado': 'O melhor remédio para a Dor Lombar é o repouso absoluto?',
        'correct': 0,
        'its_true': false,
        'check_yes': false,
        'check_no': false,
        'msg':
            'Ficar apenas em repouso ou receber tratamentos passivos não irão melhorar a sua dor. Viver em movimento sim! Na verdade, o movimento é um dos maiores aliados no tratamento da dor lombar!',
      },
      onValueChange: _onValueChange,
    ));
    // =====================

    // ==== 6a Questão =====
    answersControllers.add({
      "questao_id": 5,
      "answered": false,
      "correct_answer": false,
      "item_check": 0
    });
    questoes.add(new Questao(
      index: 5,
      answerController: answersControllers[4],
      questao: {
        'enunciado': 'A caminhada é recomendada para pessoas com Dor Lombar?',
        'correct': 0,
        'its_true': true,
        'check_yes': false,
        'check_no': false,
        'msg':
            'A caminhada é um exercício simples, gratuito, de baixo impacto físico e com ganhos importantes para pessoas com dor crônica. Você nunca caminhou ou não faz nenhum exercício físico? Comece aos poucos.',
      },
      onValueChange: _onValueChange,
    ));
    // =====================

    // ==== 7a Questão =====
    answersControllers.add({
      "questao_id": 6,
      "answered": false,
      "correct_answer": false,
      "item_check": 0
    });
    questoes.add(new Questao(
      index: 6,
      answerController: answersControllers[4],
      questao: {
        'enunciado':
            'O ideal é iniciar por atividades físicas com movimentos mais complexos e depois realizar as mais simples?',
        'correct': 0,
        'its_true': false,
        'check_yes': false,
        'check_no': false,
        'msg':
            'Você não precisa iniciar pelo movimento mais desafiador! Procure por movimentos mais fáceis e simples, sempre respeitando os limites do seu corpo e, conforme for se sentindo seguro(a), progrida aos poucos, até ganhar mais confiança!',
      },
      onValueChange: _onValueChange,
    ));
    // =====================

    // ==== 8a Questão =====
    answersControllers.add({
      "questao_id": 7,
      "answered": false,
      "correct_answer": false,
      "item_check": 0
    });
    questoes.add(new Questao(
      index: 7,
      answerController: answersControllers[4],
      questao: {
        'enunciado':
            'Exercícios de relaxamento irão ajudar no controle da Dor Lombar?',
        'correct': 0,
        'its_true': false,
        'check_yes': false,
        'check_no': false,
        'msg':
            'Exercícios que lhe ajudam a relaxar o corpo e a mente são ótimos aliados no alívio da dor! Exercícios de respiração, técnicas de relaxamento e meditação são opções que podem fazer parte do seu dia a dia.',
      },
      onValueChange: _onValueChange,
    ));
    // =====================

    return questoes;
  }

  void _onValueChange(Map value, int index) {
    setState(() {
      answersControllers[index] = value;
    });
  }

  checkAnswersControllers() {
    bool hasUnansweredQuestions = false;

    for (var answer in answersControllers) {
      if (answer['answered'] == false) {
        hasUnansweredQuestions = true;
        return hasUnansweredQuestions;
      }
    }

    return false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width * 0.90,
            margin: EdgeInsets.only(top: 20),
            child: complete
                ? Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Card(
                          elevation: 8,
                          child: showResponseAlert
                              ? Padding(
                                  padding: const EdgeInsets.all(25),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Muito bem!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.black54),
                                      ),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5)),
                                      RaisedButton(
                                        child: new Text("Concluir capítulo",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        color: Colors.green[400],
                                        onPressed: () {
                                          // Navigator.push(
                                          //   context, MaterialPageRoute(builder: (context) => TurmasAluno())
                                          // );
                                        },
                                      ),
                                    ],
                                  ))
                              : Padding(
                                  padding: const EdgeInsets.all(25),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Deseja mesmo finalizar o quiz?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.black54),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          new RaisedButton(
                                            child: new Text("Não",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            color: Colors.red[400],
                                            onPressed: () {
                                              setState(() => complete = false);
                                              setState(() => currentStep = 0);
                                              setState(() => firstPage = true);
                                              setState(() => lastPage = false);
                                            },
                                          ),
                                          new RaisedButton(
                                            child: new Text("Sim",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            color: Colors.green[400],
                                            onPressed: () async {
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  BookScreen.routeName,
                                                  (route) => false);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                    ),
                  )
                : Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      margin: EdgeInsets.only(bottom: 15),
                      child: StepProgressIndicator(
                        totalSteps: 7,
                        currentStep: currentStep,
                        size: 6,
                        padding: 0,
                        selectedColor: Colors.green[400],
                        unselectedColor: Colors.black26,
                      ),
                    ),
                    questoes.length == 0
                        ? PageSlider(
                            key: _slider,
                            duration: Duration(milliseconds: 400),
                            pages: createQuestions(context),
                          )
                        : PageSlider(
                            key: _slider,
                            duration: Duration(milliseconds: 400),
                            pages: questoes,
                          ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          firstPage
                              ? Container()
                              : FloatingActionButton(
                                  backgroundColor: Colors.green[400],
                                  child: Icon(Icons.arrow_back_ios),
                                  onPressed: () {
                                    setState(() {
                                      currentStep = currentStep - 1;
                                    });
                                    if (currentStep == 0) {
                                      setState(() {
                                        firstPage = true;
                                      });
                                    }

                                    if (currentStep < 7) {
                                      setState(() {
                                        lastPage = false;
                                      });
                                    }
                                    _slider.currentState.previous();
                                  },
                                ),
                          lastPage
                              ? RaisedButton(
                                  child: Text(
                                    'FINALIZAR',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: Colors.green[400],
                                  onPressed: () {
                                    // if(checkAnswersControllers()) {
                                    //   setState(() {
                                    //     hasUnansweredQuestions = true;
                                    //   });
                                    // } else {
                                    setState(() {
                                      complete = true;
                                    });
                                    // }
                                  },
                                  padding: const EdgeInsets.all(20.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                  ),
                                )
                              : FloatingActionButton(
                                  backgroundColor: Colors.green[400],
                                  child: Icon(Icons.arrow_forward_ios),
                                  onPressed: () {
                                    setState(() {
                                      currentStep = currentStep + 1;
                                    });
                                    if (currentStep > 0) {
                                      setState(() {
                                        firstPage = false;
                                      });
                                    }

                                    if (currentStep == 7) {
                                      setState(() {
                                        lastPage = true;
                                      });
                                    }

                                    _slider.currentState.next();
                                  },
                                ),
                        ],
                      ),
                    ),
                    hasUnansweredQuestions
                        ? Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Text(
                              'Existem questões que não foram respondidas, por favor, volte e as responda',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.red[300],
                                fontSize: 15,
                              ),
                            ),
                          )
                        : Container()
                  ])),
      ]),
      backgroundColor: Colors.white,
    );
  }
}

class Questao extends StatefulWidget {
  const Questao(
      {this.index, this.questao, this.onValueChange, this.answerController});

  final int index;
  final Map questao;
  final Map answerController;
  final void Function(Map, int) onValueChange;

  @override
  State createState() => new QuestaoState();
}

class QuestaoState extends State<Questao> {
  Map answerController;
  Map questao;
  int index;
  int currentS;

  @override
  void initState() {
    super.initState();
    answerController = widget.answerController;
    questao = widget.questao;
    index = widget.index;
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      questao['enunciado'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black54,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  RadioListTile(
                    value: questao['check_yes'],
                    groupValue: answerController['item_checked'],
                    title: Text('Sim'),
                    onChanged: (item) {
                      setState(() {
                        if (questao['check_no'] = true) {
                          questao['check_no'] = false;
                        }

                        questao['check_yes'] = true;
                        answerController["item_checked"] = true;

                        if (questao['its_true'] == true) {
                          questao["correct"] = true;
                        } else {
                          questao["correct"] = false;
                        }
                      });
                      widget.onValueChange(answerController, index);
                    },
                    activeColor: Colors.green,
                  ),
                  RadioListTile(
                    value: questao['check_no'],
                    groupValue: answerController['item_checked'],
                    title: Text('Não'),
                    onChanged: (item) {
                      setState(() {
                        if (questao['check_yes'] = true) {
                          questao['check_yes'] = false;
                        }
                        questao['check_no'] = true;
                        answerController["item_checked"] = true;
                        answerController["answered"] = true;

                        if (questao['its_true'] == false) {
                          questao["correct"] = true;
                        } else {
                          questao["correct"] = false;
                        }
                      });
                      widget.onValueChange(answerController, index);
                    },
                    activeColor: Colors.green,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: questao['correct'] == true
                        ? Column(
                            children: <Widget>[
                              Text(
                                'Muito bem!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                              ),
                              Text(
                                "\n${questao['msg']}\n",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                              )
                            ],
                          )
                        : questao['correct'] == false
                            ? Column(
                                children: <Widget>[
                                  Text(
                                    questao['its_true']
                                        ? 'Na verdade, a resposta correta é Sim!'
                                        : 'Na verdade a resposta correta é Não!',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.red[300], fontSize: 18),
                                  ),
                                  Text(
                                    "\n${questao['msg']}\n",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 18),
                                  )
                                ],
                              )
                            : Container(),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/book/chapters_content/chapter02.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController _scrollController = new ScrollController();
  MainController controller = MainController();

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
  List selectedFrases = [];

  int currentFormIndex = 0;
  Size mediaSize;
  bool aux;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    List<Widget> formsPesquisas = [
      Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: mediaSize.height * 0.05,
                  ),
                  child: Text("Você faz uso de algum \n       medicamento?",
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
                      componentUseMedication(context, "Sim", true, controller),
                      componentUseMedication(context, "Não", false, controller),
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
                          componentFormMedication(context, 'Todo dia'),
                          componentFormMedication(
                              context, '2 ou 3 vezes na semana'),
                          componentFormMedication(context, '1 vez na semana'),
                          componentFormMedication(context, '2 vezes ao mês'),
                          componentFormMedication(context, '1 vez ao mês'),
                        ],
                      )
                    : Container(),
                Container(
                  margin: EdgeInsets.only(top: mediaSize.height * 0.05),
                  child: RaisedButton(
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
              child: RaisedButton(
                onPressed: () {
                  _scrollController.animateTo(
                    0.0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );
                  setState(() {
                    currentFormIndex = 2;
                  });
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
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Chapter02.routeName, (route) => false);
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

  componentFormMedication(BuildContext context, String label) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 50, top: 10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.blue[200]),
                borderRadius: BorderRadius.circular(5),
              ),
              child: controller.timeDor == label
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
                controller.changeTimeDor(label);
              });
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
      MainController controller) {
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
              child: controller.medication == value
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
                controller.changedMedication(value);
                aux = controller.medication;
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

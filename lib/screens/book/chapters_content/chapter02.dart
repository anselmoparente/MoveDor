import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/models/Chapter.dart';
import 'components/custom_app_bar.dart';

class Chapter02 extends StatefulWidget {
  static String routeName = "/chapter-02";
  @override
  _Chapter02State createState() => _Chapter02State();
}

class _Chapter02State extends State<Chapter02> {
  bool aux;
  Size mediaSize;
  MainController controller = MainController();
  TextEditingController textController;
  double fontSize = 18;
  String dropdownValue;
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

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(chapters[2]),
      body: SingleChildScrollView(
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
                  left: mediaSize.width * 0.35, top: mediaSize.height * 0.03),
              child: Column(
                children: [
                  componentFormsMedication(context, "Sim", true, controller),
                  componentFormsMedication(context, "Não", false, controller),
                ],
              ),
            ),
            aux == true
                ? Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      'Qual a frequência que você utiliza esses medicamentos?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xff36a9b0),
                        fontSize: mediaSize.width * 0.07,
                      ),
                    ),
                  )
                : Container(),
            aux == true
                ? Container(
                    margin: EdgeInsets.only(top: mediaSize.height * 0.02),
                    child: DropdownButton(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blueAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'Todo dia',
                        '2 ou 3 vezes na semana',
                        '1 vez na semana',
                        '2 vezes no mês',
                        '1 vez no mês'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                : Container(),
            aux == true
                ? Container(
                    margin: EdgeInsets.only(top: mediaSize.height * 0.04),
                    child: Text("Qual/Quais?",
                        style: TextStyle(
                          color: Color(0xff36a9b0),
                          fontSize: mediaSize.width * 0.05,
                        )),
                  )
                : Container(),
            aux == true
                ? Container(
                    margin: EdgeInsets.only(top: mediaSize.height * 0.04),
                    width: mediaSize.width * 0.7,
                    child: TextField(
                      controller: textController,
                      minLines: 2,
                      maxLines: 5,
                      onChanged: (value) {
                        controller.nameMedications = value;
                      },
                    ))
                : Container(),
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
                            fontSize: fontSize.toDouble(),
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
                onPressed: () {},
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
    );
  }

  Widget componentFormsMedication(BuildContext context, String label,
      bool value, MainController controller) {
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
              child: aux == value
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
                print(controller.medication);
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

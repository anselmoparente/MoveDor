import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:movedor/screens/book/book_screen.dart';
import 'package:rich_alert/rich_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController _scrollController = new ScrollController();

  int currentFormIndex = 0;

  final _name = GlobalKey<FormState>();
  bool _autovalidadeName = false;
  bool isDarkMode = false;
  double fontSize = 18;
  Size mediaSize;
  String aux;
  bool feelPain;
  String dropdownValue;
  // Form 1 //
  final _form1 = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final cidadeController = TextEditingController();
  final anosEstudoController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  String nascimento = '';

  bool _autovalidadeForm1 = false;

  //--------//

  // Form 2 //
  final _form2 = GlobalKey<FormState>();

  bool alertaDeRiscoMostrado = false;

  Map<String, bool> searchSportQuestions = {
    'Caminhar com os amigos': false,
    'Correr ao ar livre': false,
    'Dançar': false,
    'Andar de bicicleta​': false,
    'Nadar': false,
    'Academia na praça': false,
    'Outra (s)': false,
    'Não pratico atividades físicas': false,
  };

  Map<String, bool> searchsSintomsQuestions = {
    'Infecção': false,
    'Câncer': false,
    'Febre': false,
    'Perda de peso não intencional ': false,
    'Diminuição da força nas pernas ': false,
    'Perda de sensibilidade progressiva​': false,
    'Eventos traumáticos graves': false,
    'Incontinência úrinaria ou fecal': false,
  };

  List selectedSports = [];
  List selectedSintoms = [];
  //--------//

  // // Form 3 //
  // final _form3 = GlobalKey<FormState>();
  // Map<String, bool> frases = {
  //   'Fico em casa a maior parte do tempo por causa de minhas costas.': false,
  //   'Mudo de posição frequentemente tentando deixar minhas costas confortáveis.':
  //       false,
  //   'Ando mais devagar que o habitual por causa de minhas costas.': false,
  //   'Por causa de minhas costas, eu não estou fazendo nenhum dos meus trabalhos que geralmente faço em casa.':
  //       false,
  //   'Por causa de minhas costas, eu uso o corrimão para subir escadas.': false,
  //   'Por causa de minhas costas, eu me deito para descansar mais frequentemente.':
  //       false,
  //   'Por causa de minhas costas, eu tenho que me apoiar em alguma coisa para me levantar de uma cadeira normal.':
  //       false,
  //   'Por causa de minhas costas, tento conseguir com que outras pessoas façam as coisas para mim.':
  //       false,
  //   'Eu me visto mais lentamente que o habitual por causa de minhas costas.':
  //       false,
  //   'Eu somente fico em pé por períodos curtos de tempo por causa de minhas costas.':
  //       false,
  //   'Por causa de minhas costas, evito me abaixar ou me ajoelhar.': false,
  //   'Encontro dificuldades em me levantar de uma cadeira por causa de minhas costas.':
  //       false,
  //   'As minhas costas doem quase o tempo todo.': false,
  //   'Tenho dificuldade em me virar na cama por causa de minhas costas.': false,
  //   'Meu apetite não é muito bom por causa das dores em minhas costas.': false,
  //   'Tenho problemas para colocar minhas meias (ou meia-calça) por causa das dores em minhas costas.':
  //       false,
  //   'Caminho apenas curtas distâncias por causa de minhas dores nas costas.':
  //       false,
  //   'Não durmo tão bem por causa de minhas costas.': false,
  //   'Por causa de minhas dores nas costas, eu me visto com ajuda de outras pessoas.':
  //       false,
  //   'Fico sentado a maior parte do dia por causa de minhas costas.': false,
  //   'Evito trabalhos pesados em casa por causa de minhas costas.': false,
  //   'Por causa das dores em minhas costas, fico mais irritado e mal humorado com as pessoas que o habitual.':
  //       false,
  //   'Por causa de minhas costas, eu subo escadas mais vagarosamente do que o habitual.':
  //       false,
  //   'Fico na cama a maior parte do tempo por causa de minhas costas.': false,
  // };
  // List selectedFrases = [];
  double sliderValue = 0.0;

  // //--------//

  // Form 4 //
  final _form4 = GlobalKey<FormState>();
  Map<String, bool> startBackFrases = {
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
  //--------//

  Future<void> _setAnsweredSearchTrue() async {
    print('ok');
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    List<Widget> formsPesquisas = [
      Container(
        height: MediaQuery.of(context).size.height,
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
                      new TextSpan(text: 'Seja bem vindo ao '),
                      new TextSpan(
                          text: 'MoveDor!',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MontserratBold')),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                width: MediaQuery.of(context).size.width * 0.9,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: isDarkMode ? Colors.white70 : Colors.black54,
                        fontSize: 24),
                    children: <TextSpan>[
                      new TextSpan(
                          text:
                              '''Esse app é voltado para pessoas com Dor Lombar Crônica!
  Antes de iniciarmos, gostaríamos de fazer algumas perguntas para que possamos te conhecer melhor, pode ser? '''),
                      new TextSpan(
                          text: '😁',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'MontserratBold')),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                width: MediaQuery.of(context).size.width * 0.9,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: isDarkMode ? Colors.white70 : Colors.black54,
                        fontSize: 24),
                    children: <TextSpan>[
                      new TextSpan(
                          text:
                              'Ao clicar em avançar, você concorda com os nossos '),
                      new TextSpan(
                          text: ' termos de uso',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.pushNamed(context, Terms.routeName, (route) => false);

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Terms()),
                              // );
                            }),
                      new TextSpan(
                          text:
                              ' e nos autoriza a utilizar as informações aqui coletadas para '),
                      new TextSpan(
                          text: 'FINS DE PESQUISA CIENTÍFICA.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
              Center(
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
      Container(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _name,
            autovalidate: _autovalidadeName,
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
                          new TextSpan(text: 'Primeiro, nos diga seu nome'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 25),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: nomeController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  isDarkMode ? Colors.white70 : Colors.black45,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  isDarkMode ? Colors.white70 : Colors.black45,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  isDarkMode ? Colors.white70 : Colors.black45,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  isDarkMode ? Colors.white70 : Colors.black45,
                            ),
                          ),
                          labelText: 'Seu nome',
                          labelStyle: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: isDarkMode ? Colors.white70 : Colors.black45,
                          )),
                      style: TextStyle(
                          color: isDarkMode ? Colors.white70 : Colors.black54),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, informe o seu nome.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () async {
                        if (_name.currentState.validate()) {
                          final prefs = await SharedPreferences.getInstance();

                          final endIndex = nomeController.text.indexOf(" ");
                          var name = nomeController.text;

                          if (endIndex > -1) {
                            name = nomeController.text.substring(0, endIndex);
                          }

                          nomeController.text = name;

                          prefs.setString("name", name);

                          _scrollController.animateTo(
                            0.0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                          setState(() {
                            currentFormIndex = 2;
                          });
                        } else {
                          setState(() {
                            _autovalidadeName = true;
                          });
                        }
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
                            "Pronto!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          )),
      Container(
        height: MediaQuery.of(context).size.height,
        child: Form(
            key: _form1,
            autovalidate: _autovalidadeForm1,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context, showTitleActions: true,
                        onConfirm: (date) {
                      var data = "${date.toLocal()}".split(' ')[0];
                      var newData = data.split('-');

                      setState(() {
                        nascimento =
                            "${newData[2]}/${newData[1]}/${newData[0]}";
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.pt);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: isDarkMode ? Colors.white70 : Colors.black45,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    margin: EdgeInsets.only(top: 25),
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      nascimento.length > 1 ? nascimento : 'Data de nascimento',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                          fontSize: 16,
                          fontFamily: 'MontserratRegular',
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: cidadeController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: isDarkMode ? Colors.white70 : Colors.black45,
                      ),
                      labelText: 'Em que cidade você mora?',
                    ),
                    style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Informe a cidade em que mora.';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: anosEstudoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: isDarkMode ? Colors.white70 : Colors.black45,
                      ),
                      labelText: 'Você estudou por quantos anos?',
                    ),
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: isDarkMode ? Colors.white70 : Colors.black54),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Informe por quantos anos você estudou.';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: isDarkMode ? Colors.white70 : Colors.black45,
                      ),
                      labelText: 'Qual o seu peso (kg)?',
                    ),
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: isDarkMode ? Colors.white70 : Colors.black54),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Informe o seu peso.';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isDarkMode ? Colors.white70 : Colors.black45,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isDarkMode ? Colors.white70 : Colors.black45,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isDarkMode ? Colors.white70 : Colors.black45,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isDarkMode ? Colors.white70 : Colors.black45,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: isDarkMode ? Colors.white70 : Colors.black45,
                        ),
                        labelText: 'Qual a sua altura?'),
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: isDarkMode ? Colors.white70 : Colors.black54),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Informe a sua altura.';
                      }
                      return null;
                    },
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: RaisedButton(
                      onPressed: () {
                        _scrollController.animateTo(
                          0.0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                        setState(() {
                          currentFormIndex = 3;
                        });
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
      Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: mediaSize.height * 0.05, left: 20),
                child: Text(
                  'Você está aqui por que sente dor nas costas?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                    fontSize: fontSize.toDouble() + 6,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: mediaSize.height * 0.05, left: 20),
                child: componentForms(context, "Sim", true),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: componentForms(context, "Não", false),
              ),
              feelPain == true
                  ? Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05),
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            'Escala de dor: Numa escala de 0 a 10, qual o grau de dor que você apresenta hoje?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'MontserratRegular',
                              color:
                                  isDarkMode ? Colors.white70 : Colors.black54,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Sem dor',
                                  style: TextStyle(
                                      fontFamily: 'MontserratBold',
                                      color: Colors.green),
                                ),
                                Text(
                                  'Muita dor',
                                  style: TextStyle(
                                      fontFamily: 'MontserratBold',
                                      color: Colors.red),
                                ),
                              ],
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: Slider(
                                value: sliderValue,
                                max: 10.0,
                                min: 0.0,
                                divisions: 10,
                                label: "${sliderValue.toInt()}",
                                inactiveColor: Colors.green[50],
                                activeColor: sliderValue.toInt() > 8
                                    ? Colors.red
                                    : sliderValue.toInt() > 5
                                        ? Colors.red[300]
                                        : sliderValue.toInt() > 3
                                            ? Colors.green[300]
                                            : Colors.green,
                                onChanged: (double value) {
                                  setState(() {
                                    sliderValue = value;
                                  });
                                })),
                        Container(
                          margin: EdgeInsets.only(top: mediaSize.height * 0.05),
                          child: Text(
                            'A quanto tempo você sente essa dor?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'MontserratRegular',
                              color: isDarkMode ? Colors.white70 : Colors.black54,
                              fontSize: fontSize.toDouble() + 6,
                            ),
                          ),
                        ),
                        Container(
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
                              'até 6 semanas',
                              'de 7 semanas a 3 meses',
                              'mais de 3 meses',
                              'mais de 1 ano'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )
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
                      if (feelPain == true) {
                        currentFormIndex = 4;
                      }
                    });
                    if (feelPain == false) {
                      print("entrou");
                      _showMyDialog(context);
                    }
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
      Form(
          key: _form2,
          autovalidate: _autovalidadeForm1,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25),
                width: MediaQuery.of(context).size.width * 0.90,
                child: Text(
                  'Você pratica alguma atividade física?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                    fontSize: fontSize.toDouble() + 6,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: searchSportQuestions.keys.map((String key) {
                    return new CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFF36a9b0),
                      title: new Text(
                        key,
                        style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                          fontSize: fontSize.toDouble(),
                        ),
                      ),
                      value: searchSportQuestions[key],
                      onChanged: (bool value) {
                        if (key == 'Não pratico atividades físicas' && value) {
                          setState(() {
                            selectedSports = [];
                            searchSportQuestions['Caminhar com os amigos'] =
                                false;
                            searchSportQuestions['Correr ao ar livre'] = false;
                            searchSportQuestions['Dançar'] = false;
                            searchSportQuestions['Andar de bicicleta​'] = false;
                            searchSportQuestions['Nadar'] = false;
                            searchSportQuestions['Academia na praça'] = false;
                            searchSportQuestions['Outra (s)'] = false;
                          });
                        }
                        if (value) {
                          setState(() {
                            selectedSports.add(key);
                          });
                        } else {
                          setState(() {
                            selectedSports.remove(key);
                          });
                        }
                        setState(() {
                          searchSportQuestions[key] = value;
                        });
                        // print(selectedSports);
                      },
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                width: MediaQuery.of(context).size.width * 0.90,
                child: Text(
                  'Você possui algum desses sintomas?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                    fontSize: fontSize.toDouble() + 6,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  children: searchsSintomsQuestions.keys.map((String key) {
                    return new CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFF36a9b0),
                      title: new Text(
                        key,
                        style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                          fontSize: fontSize.toDouble(),
                        ),
                      ),
                      value: searchsSintomsQuestions[key],
                      onChanged: (bool value) {
                        if (!alertaDeRiscoMostrado) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return RichAlertDialog(
                                  alertTitle:
                                      richTitle("Olá! Que bom tê-lo por aqui!"),
                                  alertSubtitle: richSubtitle(
                                      "Recomendamos que você realize uma avaliação mais detalhada no posto de saúde próximo da sua casa ou com um profissional de saúde da sua confiança."),
                                  // alertTitle: richTitle(
                                  //   Text(
                                  //     "Esses sintomas\nmerecem atenção.",
                                  //     textAlign: TextAlign.center,
                                  //     style: TextStyle (
                                  //       fontSize: 24,
                                  //       color: Colors.black87
                                  //     ),
                                  //   )
                                  // ),
                                  // alertSubtitle: richSubtitle(
                                  //   Text(
                                  //       "Busque um atendimento médico.",
                                  //     textAlign: TextAlign.center,
                                  //     style: TextStyle (
                                  //       color: Colors.black45
                                  //     ),
                                  //   )
                                  // ),
                                  alertType: RichAlertType.WARNING,
                                  actions: <Widget>[
                                    RaisedButton(
                                      child: Text(
                                        "OK",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.green[300],
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        }

                        setState(() {
                          searchsSintomsQuestions[key] = value;
                          alertaDeRiscoMostrado = true;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 80),
                  child: RaisedButton(
                    onPressed: () {
                      _scrollController.animateTo(
                        0.0,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                      setState(() {
                        currentFormIndex = 5;
                      });
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
      Form(
          key: _form4,
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
                    color: isDarkMode ? Colors.white70 : Colors.black54,
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
                          color: isDarkMode ? Colors.white70 : Colors.black54,
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
                    color: isDarkMode ? Colors.white70 : Colors.black54,
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
                    onPressed: () {
                      _scrollController.animateTo(
                        0.0,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                      setState(() {
                        startBackSliderValue >= 3
                            ? startBackPoints += 1
                            : print('');

                        currentFormIndex = 6;
                      });

                      // print(startBackSelectedFrases);
                      // print(startBackPoints);
                      // print(startBackSliderLabel);
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
      Container(
        height: MediaQuery.of(context).size.height,
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
                      new TextSpan(
                          text: 'Muito obrigado, ${nomeController.text}'),
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
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                      fontSize: 25),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    _setAnsweredSearchTrue();
                    Navigator.pushNamedAndRemoveUntil(
                        context, BookScreen.routeName, (route) => false);
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
              : currentFormIndex == 2
                  ? formsPesquisas[2]
                  : currentFormIndex == 3
                      ? formsPesquisas[3]
                      : currentFormIndex == 4
                          ? formsPesquisas[4]
                          : currentFormIndex == 5
                              ? formsPesquisas[5]
                              : formsPesquisas[6]

    ]);
  }

  componentForms(BuildContext context, String label, bool value) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.blue[200]),
                borderRadius: BorderRadius.circular(5),
              ),
              child: aux == label
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
                aux = label;
                feelPain = value;
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

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text(
            "Este aplicativo é destinado para educação e estímulo à atividade física para pessoas que sentem dor na parte mais baixa das costas.",
            style: TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

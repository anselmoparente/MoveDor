import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rich_alert/rich_alert.dart';

import 'package:movedor/constants.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/controllers/search_controller.dart';
import 'package:movedor/screens/book/book_screen.dart';

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

  List<String> selectedSports = [];
  List<String> selectedSintoms = [];

  double sliderValue = 0.0;

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
  var dataSend;

  SnackBar customSnackBar({String message}) {
    return SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.only(bottom: 80.0, left: 10.0, right: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);
    final searchController = Provider.of<SearchController>(context);
    mediaSize = MediaQuery.of(context).size;

    List<Widget> formsPesquisas = [
      Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(top: mediaSize.height * 0.15, bottom: 40),
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
      SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Form(
              key: _name,
              autovalidate: _autovalidadeName,
              child: Column(
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
                                color: isDarkMode
                                    ? Colors.white70
                                    : Colors.black45,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isDarkMode
                                    ? Colors.white70
                                    : Colors.black45,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isDarkMode
                                    ? Colors.white70
                                    : Colors.black45,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isDarkMode
                                    ? Colors.white70
                                    : Colors.black45,
                              ),
                            ),
                            labelText: 'Seu nome',
                            labelStyle: TextStyle(
                              fontFamily: 'MontserratRegular',
                              color:
                                  isDarkMode ? Colors.white70 : Colors.black45,
                            )),
                        style: TextStyle(
                            color:
                                isDarkMode ? Colors.white70 : Colors.black54),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor, informe o seu nome.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_name.currentState.validate()) {
                            final endIndex = nomeController.text.indexOf(" ");
                            var name = nomeController.text;

                            if (endIndex > -1) {
                              name = nomeController.text.substring(0, endIndex);
                            }

                            nomeController.text = name;

                            controller.name = nomeController.text;
                            FirebaseFirestore.instance
                                .collection('users_v2')
                                .doc(controller.id)
                                .set({'name': controller.name});

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
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
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
      ),
      Container(
        margin: EdgeInsets.only(top: mediaSize.height * 0.1),
        height: MediaQuery.of(context).size.height * 0.8,
        child: SingleChildScrollView(
          child: Form(
              key: _form1,
              autovalidate: _autovalidadeForm1,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      DatePicker.showDatePicker(context, showTitleActions: true,
                          onConfirm: (date) {
                        dataSend = date;
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
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        nascimento.length > 1
                            ? '       ' + nascimento
                            : '       Data de nascimento',
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
                          labelStyle: TextStyle(
                            color: isDarkMode ? Colors.white70 : Colors.black45,
                          ),
                          labelText: 'Qual a sua altura (cm)?'),
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
                      child: ElevatedButton(
                        onPressed: () {
                          if (dataSend == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(
                                    message: 'Digite uma data de nascimento!'));
                          } else if (cidadeController.text == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(
                                    message:
                                        'Digite a cidade onde você mora!'));
                          } else if (anosEstudoController.text == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(
                                    message: 'Digite o seu tempo de estudo!'));
                          } else if (pesoController.text == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(message: 'Digite o seu peso!'));
                          } else if (alturaController.text == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(
                                    message: 'Digite a sua altura!'));
                          } else {
                            print(controller.id);
                            FirebaseFirestore.instance
                                .collection('users_v2')
                                .doc(controller.id)
                                .update({
                              'birth_date': dataSend,
                              'city': cidadeController.text,
                              'height': int.parse(alturaController.text),
                              'study': int.parse(anosEstudoController.text),
                              'weight': int.parse(pesoController.text)
                            });
                            _scrollController.animateTo(
                              0.0,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                            setState(() {
                              currentFormIndex = 3;
                            });
                          }
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
      Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: mediaSize.height * 0.25),
                child: Text(
                  'Você está aqui por que sente dor nas costas?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: kPrimaryColor,
                    fontSize: fontSize.toDouble() + 6,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: mediaSize.height * 0.05, left: 20),
                child: componentForms(context, "Sim", true, searchController),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: componentForms(context, "Não", false, searchController),
              ),
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
                      if (searchController.feelPain == true) {
                        currentFormIndex = 4;
                      }
                    });
                    if (searchController.feelPain == false) {
                      _showMyDialog(context);
                    }
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
      Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Em qual região \n das costas você sente dor?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Selecione abaixo:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                  fontSize: 20,
                ),
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: mediaSize.width * 0.1,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      searchController.painSup
                          ? "assets/caps_illustrations/dorSup_selecionado.png"
                          : "assets/caps_illustrations/dorSup_não_selecionado.png",
                      height: mediaSize.height * 0.6,
                      width: mediaSize.width * 0.35,
                    ),
                    onTap: () {
                      if (searchController.painSup == false) {
                        setState(() {
                          searchController.changePainInf(false);
                          searchController.changePainSup(true);
                        });
                      }
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      searchController.painInf
                          ? "assets/caps_illustrations/dorInf_selecionado.png"
                          : "assets/caps_illustrations/dorInf_não_selecionado.png",
                      height: mediaSize.height * 0.6,
                      width: mediaSize.width * 0.35,
                    ),
                    onTap: () {
                      if (searchController.painInf == false) {
                        setState(() {
                          searchController.changePainInf(true);
                          searchController.changePainSup(false);
                        });
                      }
                    },
                  ),
                ],
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      0.0,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                    setState(() {
                      if (searchController.painInf == true) {
                        currentFormIndex = 5;
                      }
                    });
                    if (searchController.painInf == false) {
                      _showMyDialog(context);
                    }
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
      Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
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
                              fontFamily: 'MontserratBold', color: Colors.red),
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
                            searchController.changePainScale(value);
                          });
                        })),
                Container(
                  margin: EdgeInsets.only(top: mediaSize.height * 0.05),
                  child: Text(
                    'Há quanto tempo \n você sente essa dor?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                      fontSize: fontSize.toDouble() + 6,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                componentFormPain(context, 'até 6 semanas', searchController),
                componentFormPain(
                    context, 'de 7 semanas a 3 meses', searchController),
                componentFormPain(context, 'mais de 3 meses', searchController),
                componentFormPain(context, 'mais de 1 ano', searchController),
                Container(
                  margin: EdgeInsets.only(top: mediaSize.height * 0.05),
                  child: ElevatedButton(
                    onPressed: () {
                      if (searchController.timeDor == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(
                                message:
                                    'Marque o tempo que você sente essa dor!'));
                      } else {
                        _scrollController.animateTo(
                          0.0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                        setState(() {
                          currentFormIndex = 6;
                        });
                      }
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
                    color: kPrimaryColor,
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
                    color: kPrimaryColor,
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
                                    ElevatedButton(
                                      child: Text(
                                        "OK",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green[300],
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        }

                        if (value) {
                          setState(() {
                            selectedSintoms.add(key);
                          });
                        } else {
                          setState(() {
                            selectedSintoms.remove(key);
                          });
                        }
                        setState(() {
                          searchsSintomsQuestions[key] = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      searchController.selectedSports.addAll(selectedSports);
                      searchController.selectedSintoms.addAll(selectedSintoms);
                      if (selectedSports.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(
                                message: 'Marque a opção de esporte!'));
                      } else if (selectedSintoms.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(
                                message: 'Marque a opção de sintomas!'));
                      } else {
                        _scrollController.animateTo(
                          0.0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                        setState(() {
                          currentFormIndex = 7;
                        });
                      }
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
                  child: ElevatedButton(
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

                        currentFormIndex = 8;
                      });

                      // print(startBackSelectedFrases);
                      // print(startBackPoints);
                      // print(startBackSliderLabel);
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                'Estamos quase lá! \n Selecione o que você julga \n das afirmativas abaixo:',
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
                  top: MediaQuery.of(context).size.height * 0.05),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                'ESTAS QUESTÕES SÃO SOBRE \n AS SUAS PRÓPRIAS COSTAS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                  fontSize: fontSize.toDouble() + 6,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            componentFormSliderText(
                "1. É fácil de machucar as suas costas",
                searchController.question1,
                searchController.textQuestion1,
                searchController.changeTextQ1,
                searchController.changeQuestion1),
            componentFormSliderText(
                "2. Se você não for cuidadoso, você pode machucar suas costas",
                searchController.question2,
                searchController.textQuestion2,
                searchController.changeTextQ2,
                searchController.changeQuestion2),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                'ESTAS QUESTÕES SÃO SOBRE \n DOR NAS COSTAS EM GERAL:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                  fontSize: fontSize.toDouble() + 6,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            componentFormSliderText(
                "3. Dor nas costas significa que você lesionou suas costas",
                searchController.question3,
                searchController.textQuestion3,
                searchController.changeTextQ3,
                searchController.changeQuestion3),
            componentFormSliderText(
                "4. Uma “fisgadinha” nas costas pode ser o primeiro sinal de uma lesão séria",
                searchController.question4,
                searchController.textQuestion4,
                searchController.changeTextQ4,
                searchController.changeQuestion4),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                'ESTAS QUESTÕES SÃO SOBRE \n A RECUPERAÇÃO DA DOR NAS COSTAS:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                  fontSize: fontSize.toDouble() + 6,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            componentFormSliderText(
                "5. Se você tem dor nas costas, você deve evitar exercícios físicos",
                searchController.question5,
                searchController.textQuestion5,
                searchController.changeTextQ5,
                searchController.changeQuestion5),
            componentFormSliderText(
                "6. Se você tem dor nas costas, você deveria tentar se manter ativo",
                searchController.question6,
                searchController.textQuestion6,
                searchController.changeTextQ6,
                searchController.changeQuestion6),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                'ESTAS QUESTÕES SÃO SOBRE \n A RECUPERAÇÃO DA DOR NAS COSTAS:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                  fontSize: fontSize.toDouble() + 6,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            componentFormSliderText(
                "7. Focar em outras coisas que não sejam as suas costas ajuda você a recuperar-se da dor nas costas",
                searchController.question7,
                searchController.textQuestion7,
                searchController.changeTextQ7,
                searchController.changeQuestion7),
            componentFormSliderText(
                "8. Ter a expectativa de que sua dor nas costas vai melhorar, ajuda você à recuperar-se de dor nas costas",
                searchController.question8,
                searchController.textQuestion8,
                searchController.changeTextQ8,
                searchController.changeQuestion8),
            componentFormSliderText(
                "9. Uma vez que você tenha tido dor nas costas, sempre existirá uma fraqueza",
                searchController.question9,
                searchController.textQuestion9,
                searchController.changeTextQ9,
                searchController.changeQuestion9),
            componentFormSliderText(
                "10. Existe uma grande chance de que um episódio de dor nas costas não se resolverá",
                searchController.question10,
                searchController.textQuestion10,
                searchController.changeTextQ10,
                searchController.changeQuestion10),
            SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _scrollController.animateTo(
                    0.0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );
                  setState(() {
                    currentFormIndex = 9;
                  });
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
            SizedBox(
              height: 20,
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
                child: ElevatedButton(
                  onPressed: () {
                    controller.searchComplete = true;
                    FirebaseFirestore.instance
                        .collection('users_v2')
                        .doc(controller.id)
                        .update({
                      'search': {
                        'search_complete': controller.searchComplete,
                        'activities_performed': searchController.selectedSports,
                        'disease': searchController.selectedSintoms,
                        'medication': {'frequency': null, 'use': null},
                        'pain': {
                          'back_pain': true,
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
                              searchController.question7 == 2
                                  ? -2
                                  : searchController.question7 == 1
                                      ? -1
                                      : searchController.question7 == 0
                                          ? 0
                                          : searchController.question7 == -1
                                              ? 1
                                              : 2,
                          'Se você não for cuidadoso, você pode machucar suas costas':
                              searchController.question2,
                          'Se você tem dor nas costas, você deve evitar exercícios físicos':
                              searchController.question5,
                          'Se você tem dor nas costas, você deveria tentar se manter ativo':
                              searchController.question6 == 2
                                  ? -2
                                  : searchController.question6 == 1
                                      ? -1
                                      : searchController.question6 == 0
                                          ? 0
                                          : searchController.question6 == -1
                                              ? 1
                                              : 2,
                          'Ter a expectativa de que sua dor nas costas vai melhorar, ajuda você à recuperar-se de dor nas costas':
                              searchController.question8 == 2
                                  ? -2
                                  : searchController.question8 == 1
                                      ? -1
                                      : searchController.question8 == 0
                                          ? 0
                                          : searchController.question8 == -1
                                              ? 1
                                              : 2,
                          'Uma vez que você tenha tido dor nas costas, sempre existirá uma fraqueza':
                              searchController.question9,
                          'Uma “fisgadinha” nas costas pode ser o primeiro sinal de uma lesão séria':
                              searchController.question4,
                          'É fácil de machucar as suas costas':
                              searchController.question1,
                        },
                        'rolland_morris': []
                      }
                    });
                    Navigator.pushNamedAndRemoveUntil(
                        context, BookScreen.routeName, (route) => false);
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
              : currentFormIndex == 2
                  ? formsPesquisas[2]
                  : currentFormIndex == 3
                      ? formsPesquisas[3]
                      : currentFormIndex == 4
                          ? formsPesquisas[4]
                          : currentFormIndex == 5
                              ? formsPesquisas[5]
                              : currentFormIndex == 6
                                  ? formsPesquisas[6]
                                  : currentFormIndex == 7
                                      ? formsPesquisas[7]
                                      : currentFormIndex == 8
                                          ? formsPesquisas[8]
                                          : formsPesquisas[9]
    ]);
  }

  componentForms(BuildContext context, String label, bool value,
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
                searchController.feelPain = value;
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(
                left: mediaSize.width * 0.03, top: mediaSize.height * 0.007),
            child: Text(label,
                style: TextStyle(
                  fontSize: mediaSize.width * 0.05,
                  color: kTextColor,
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

  componentFormPain(
      BuildContext context, String label, SearchController searchController) {
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
              child: searchController.timeDor == label
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
                searchController.changeTimeDor(label);
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

  componentFormSliderText(String label, double value, String text,
      functionSwitchText, functionSwitchValue) {
    void switchText(double value) {
      if (value == -2) {
        functionSwitchText('Falsa');
      }
      if (value == -1) {
        functionSwitchText('Possivelmente Falsa');
      }
      if (value == 0) {
        functionSwitchText('Incerto');
      }
      if (value == 1) {
        functionSwitchText('Possivelmente Verdadeira');
      }
      if (value == 2) {
        functionSwitchText('Verdadeira');
      }
    }

    return Wrap(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            width: mediaSize.width * 0.9,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                  fontSize: 18),
            ),
          ),
        ),
        Center(
          child: Container(
            width: mediaSize.width * 0.9,
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Falsa",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                      fontSize: 18),
                ),
                Text(
                  "Verdadeira",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                      fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Observer(
            builder: (_) {
              return Slider(
                min: -2,
                max: 2,
                divisions: 4,
                value: value,
                label: text,
                onChanged: (double value) {
                  setState(() {
                    functionSwitchValue(value);
                    switchText(value);
                  });
                },
              );
            },
          ),
        )
      ],
    );
  }
}

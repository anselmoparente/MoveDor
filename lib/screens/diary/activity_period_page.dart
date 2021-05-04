import 'package:flutter/material.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/book/book_screen.dart';
import '../../constants.dart';

class ActivityPeriodPage extends StatefulWidget {
  ActivityPeriodPage({Key key}) : super(key: key);

  @override
  _ActivityPeriodPageState createState() => _ActivityPeriodPageState();
}

class _ActivityPeriodPageState extends State<ActivityPeriodPage> {
  MainController controller = MainController();
  Size mediaSize;
  bool aux = false;
  double sliderValue = 0.0;
  String sliderText = 'Manhã';
  

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'Em qual período do dia você pretende realizar a(s) atividade(s)?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Color(0xff36a9b0),
                    fontSize: mediaSize.width * 0.07,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: mediaSize.width * 0.9,
                  margin: EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Começo do dia",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: kTextColor,
                            fontSize: 14.0),
                      ),
                      Text(
                        "Final do dia",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: kTextColor,
                          fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.only(top: 10.0),
              ),
              Center(
                child: Container(
                  child: Slider(
                    value: sliderValue,
                    max: 2.0,
                    min: 0.0,
                    divisions: 2,
                    label: sliderText,
                    activeColor: sliderValue.toInt() == 2
                            ? Colors.blue[900]
                            : sliderValue.toInt() == 1
                                ? Colors.orange
                                : Colors.lightBlue,
                    onChanged: (double value) {
                      setState(() {
                        value == 0
                            ? sliderText = 'Manhã'
                            : value == 1
                                ? sliderText = 'Tarde'
                                : sliderText = 'Noite';
                        sliderValue = value;
                        controller.changedActivityTime(sliderText);
                      });
                    }
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: mediaSize.height * 0.05),
                child: RaisedButton(
                  onPressed: () {
                    //TODO Remover apóe criação das novas telas
                    Navigator.pushNamedAndRemoveUntil(
                        context, BookScreen.routeName, (route) => false);
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
              ),
            ],
          ),
        ));
  }
}

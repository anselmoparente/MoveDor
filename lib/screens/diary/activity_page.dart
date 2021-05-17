import 'package:flutter/material.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/diary/calendar_page.dart';
import '../../constants.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  MainController controller = MainController();
  Size mediaSize;
  bool aux = false;
  double sliderTimeValue = 0.0;
  String sliderTimeText = '10 a 25 minutos';
  double sliderPeriodValue = 0.0;
  String sliderPeriodText = 'Manhã';

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
                  'Por quanto tempo em geral você pretende realizar a(s) atividade(s)?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Color(0xff36a9b0),
                    fontSize: mediaSize.width * 0.05,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: mediaSize.width * 0.8,
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "10 a 25 minutos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: kTextColor,
                            fontSize: 14),
                      ),
                      Text(
                        "60 minutos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: kTextColor,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                    width: mediaSize.width * 0.9,
                    margin: EdgeInsets.only(top: 10),
                    child: Slider(
                        value: sliderTimeValue,
                        max: 3.0,
                        min: 0.0,
                        divisions: 3,
                        label: sliderTimeText,
                        onChanged: (double value) {
                          setState(() {
                            value == 0
                                ? sliderTimeText = '10 a 25 minutos'
                                : value == 1
                                    ? sliderTimeText = '30 minutos'
                                    : value == 2
                                        ? sliderTimeText = '45 minutos'
                                        : sliderTimeText = '60 minutos';
                            sliderTimeValue = value;
                            controller.changedActivityTime(sliderTimeText);
                          });
                        })),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'Em qual período do dia você pretende realizar a(s) atividade(s)?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Color(0xff36a9b0),
                    fontSize: mediaSize.width * 0.05,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: mediaSize.width * 0.8,
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
                    width: mediaSize.width * 0.9,
                    child: Slider(
                        value: sliderPeriodValue,
                        max: 2.0,
                        min: 0.0,
                        divisions: 2,
                        label: sliderPeriodText,
                        activeColor: sliderPeriodValue.toInt() == 2
                            ? Colors.blue[900]
                            : sliderPeriodValue.toInt() == 1
                                ? Colors.orange
                                : Colors.lightBlue,
                        onChanged: (double value) {
                          setState(() {
                            value == 0
                                ? sliderPeriodText = 'Manhã'
                                : value == 1
                                    ? sliderPeriodText = 'Tarde'
                                    : sliderPeriodText = 'Noite';
                            sliderPeriodValue = value;
                            controller.changedActivityTime(sliderPeriodText);
                          });
                        })),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'Em quais dias da semana você pretende praticar(Nome da Atividade)?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Color(0xff36a9b0),
                    fontSize: mediaSize.width * 0.05,
                  ),
                ),
              ),
              Container(
                width: mediaSize.width * 0.95,
                height: mediaSize.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/diary/calendario.png'),
                  ),
                ),
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(top: 25),
                  child: Wrap(
                    spacing: 2,
                    children: [
                      buttonDay('DOM'),
                      buttonDay('SEG'),
                      buttonDay('TER'),
                      buttonDay('QUA'),
                      buttonDay('QUI'),
                      buttonDay('SEX'),
                      buttonDay('SAB'),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: mediaSize.height * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CalendarPage()));
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

  Widget buttonDay(String value) {
    return controller.activitysDays.contains(value)
        ? Container(
            width: 45,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/diary/seletor.png'),
              ),
            ),
            child: TextButton(
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: mediaSize.width * 0.025,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (controller.activitysDays.contains(value)) {
                    controller.activitysDays.remove(value);
                  } else {
                    controller.activitysDays.add(value);
                  }
                });
              },
            ),
          )
        : Container(
            width: 45,
            child: TextButton(
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: mediaSize.width * 0.025,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (controller.activitysDays.contains(value)) {
                    controller.activitysDays.remove(value);
                  } else {
                    controller.activitysDays.add(value);
                  }
                });
              },
            ),
          );
  }
}
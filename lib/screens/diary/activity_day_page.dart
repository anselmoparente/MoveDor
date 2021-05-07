import 'package:flutter/material.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/diary/activity_period_page.dart';

class ActivityDayPage extends StatefulWidget {
  ActivityDayPage({Key key}) : super(key: key);

  @override
  _ActivityDayPageState createState() => _ActivityDayPageState();
}

class _ActivityDayPageState extends State<ActivityDayPage> {
  MainController controller = MainController();
  Size mediaSize;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    'Em quais dias da semana\n você pretende praticar\n(Nome da Atividade)?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: Color(0xff36a9b0),
                      fontSize: mediaSize.width * 0.07,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: mediaSize.height * 0.15),
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
                  margin: EdgeInsets.only(top: mediaSize.height * 0.2),
                  child: RaisedButton(
                    onPressed: () {
                      //TODO Remover apóe criação das novas telas
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ActivityPeriodPage()));
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

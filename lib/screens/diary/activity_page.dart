import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import 'package:movedor/controllers/activity_controller.dart';
import 'package:movedor/controllers/diary_controller.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/models/activities.dart';
import 'package:movedor/models/activity_planed.dart';

import 'calendar_page.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  Size mediaSize;
  bool aux = false;
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    final controller = Provider.of<MainController>(context);
    final diaryController = Provider.of<DiaryController>(context);
    final activityController = Provider.of<ActivityController>(context);

    if (controller.first == false) {
      diaryController.activityTime.clear();
      for (int i = 0; i < diaryController.activities.length; i++) {
        diaryController.activityTime.insert(i, '10 a 25 minutos');
      }

      diaryController.activityTimeAux.clear();
      for (int i = 0; i < diaryController.activities.length; i++) {
        diaryController.activityTimeAux.insert(i, 0.0);
      }

      diaryController.activityPeriod.clear();
      for (int i = 0; i < diaryController.activities.length; i++) {
        diaryController.activityPeriod.insert(i, 'Manhã');
      }

      diaryController.activityPeriodAux.clear();
      for (int i = 0; i < diaryController.activities.length; i++) {
        diaryController.activityPeriodAux.insert(i, 0.0);
      }

      diaryController.activitysDays.clear();
      for (int i = 0; i < diaryController.activities.length; i++) {
        diaryController.activitysDays.insert(i, []);
      }

      controller.first = true;
    }

    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < diaryController.activities.length; i++)
                body(i, diaryController, controller),
              Container(
                margin: EdgeInsets.only(top: mediaSize.height * 0.05),
                child: ElevatedButton(
                  onPressed: () async {
                    diaryController.configuredDiary = true;
                    FirebaseFirestore.instance.settings =
                        Settings(persistenceEnabled: true);
                    FirebaseFirestore.instance
                        .collection('users_v2')
                        .doc(controller.id)
                        .update({
                      'configured_diary': diaryController.configuredDiary
                    });

                    for (int i = 0;
                        i < diaryController.activities.length;
                        i++) {
                      var activity = ActivityPlaned(
                          diaryController.activities[i],
                          diaryController.activityPeriod[i],
                          diaryController.activityTime[i],
                          diaryController.activitysDays[i]);
                      activityController.activitiesPlaned.add(activity);
                    }

                    for (int i = 0;
                        i < diaryController.activities.length;
                        i++) {
                      FirebaseFirestore.instance.settings =
                          Settings(persistenceEnabled: true);
                      FirebaseFirestore.instance
                          .collection('users_v2')
                          .doc(controller.id)
                          .collection('activities_planed')
                          .doc()
                          .set({
                        'activity': activityController.activitiesPlaned[i].type,
                        'days': activityController.activitiesPlaned[i].days,
                        'period': activityController.activitiesPlaned[i].period,
                        'time': activityController.activitiesPlaned[i].time,
                      });
                    }

                    int data;

                    int dayToInt(String date) {
                      date == 'Segunda'
                          ? data = 1
                          : date == 'Terça'
                              ? data = 2
                              : date == 'Quarta'
                                  ? data = 3
                                  : date == 'Quinta'
                                      ? data = 4
                                      : date == 'Sexta'
                                          ? data = 5
                                          : date == 'Sábado'
                                              ? data = 6
                                              : data = 7;
                      return data;
                    }

                    activityController.activities.clear();
                    for (int i = 0;
                        i < diaryController.activities.length;
                        i++) {
                      for (int j = 0;
                          j < diaryController.activitysDays[i].length;
                          j++) {
                        int day = dayToInt(diaryController.activitysDays[i][j]);
                        var now = new DateTime.now();
                        for (int k = 0; k < 30; k++) {
                          var newData = now.add(Duration(days: k));
                          if (newData.weekday == day) {
                            activityController.activities.add(Activities(
                                uuid.v4(),
                                diaryController.activities[i],
                                newData,
                                'Pendente',
                                null,
                                null,
                                null));
                          }
                        }
                      }
                    }

                    for (int l = 0;
                        l < activityController.activities.length;
                        l++) {
                      print(
                          'id da atividade: ${activityController.activities[l].id}');
                      FirebaseFirestore.instance.settings =
                          Settings(persistenceEnabled: true);
                      await FirebaseFirestore.instance
                          .collection('users_v2')
                          .doc(controller.id)
                          .collection('activities')
                          .doc(activityController.activities[l].id)
                          .set({
                        'type': activityController.activities[l].type,
                        'date': activityController.activities[l].date,
                        'status': activityController.activities[l].status,
                        'reason': activityController.activities[l].reason,
                        'time': activityController.activities[l].time,
                        'borg': activityController.activities[l].borg,
                      });
                    }

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

  Widget buttonDay(String value, DiaryController diaryController, int index) {
    return Observer(builder: (_) {
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
                child: diaryController.activitysDays[index].contains(value)
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
                  if (diaryController.activitysDays[index].contains(value)) {
                    diaryController.activitysDays[index].remove(value);
                  } else {
                    diaryController.activitysDays[index].add(value);
                  }
                });
              },
            ),
            Container(
              margin: EdgeInsets.only(
                  left: mediaSize.width * 0.03, top: mediaSize.height * 0.007),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: mediaSize.width * 0.035,
                  color: Color(0xff36a9b0),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget body(
      int index, DiaryController diaryController, MainController controller) {
    return Column(
      children: [
        Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            'Por quanto tempo em geral você pretende realizar ' +
                diaryController.activities[index] +
                '?',
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
        Center(child: Observer(builder: (_) {
          return Container(
              width: mediaSize.width * 0.9,
              margin: EdgeInsets.only(top: 10),
              child: Slider(
                  value: diaryController.activityTimeAux[index],
                  max: 3.0,
                  min: 0.0,
                  divisions: 3,
                  label: diaryController.activityTime[index],
                  onChanged: (double value) {
                    value == 0
                        ? diaryController.activityTime[index] =
                            '10 a 25 minutos'
                        : value == 1
                            ? diaryController.activityTime[index] = '30 minutos'
                            : value == 2
                                ? diaryController.activityTime[index] =
                                    '45 minutos'
                                : diaryController.activityTime[index] =
                                    '60 minutos';
                    diaryController.activityTimeAux[index] = value;
                  }));
        })),
        Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            'Em qual período do dia você pretende realizar a atividade?',
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
          child: Observer(builder: (_) {
            return Container(
                width: mediaSize.width * 0.9,
                child: Slider(
                    value: diaryController.activityPeriodAux[index],
                    max: 2.0,
                    min: 0.0,
                    divisions: 2,
                    label: diaryController.activityPeriod[index],
                    activeColor: diaryController.activityPeriodAux[index]
                                .toInt() ==
                            2
                        ? Colors.blue[900]
                        : diaryController.activityPeriodAux[index].toInt() == 1
                            ? Colors.orange
                            : Colors.lightBlue,
                    onChanged: (double value) {
                      value == 0
                          ? diaryController.activityPeriod[index] = 'Manhã'
                          : value == 1
                              ? diaryController.activityPeriod[index] = 'Tarde'
                              : diaryController.activityPeriod[index] = 'Noite';
                      diaryController.activityPeriodAux[index] = value;
                    }));
          }),
        ),
        Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            'Em quais dias da semana você pretende praticar?',
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
          height: mediaSize.height * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/diary/calendario.png'),
            ),
          ),
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(left: mediaSize.width * 0.28),
            padding: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                SizedBox(
                  height: mediaSize.height * 0.12,
                ),
                buttonDay('Domingo', diaryController, index),
                buttonDay('Segunda', diaryController, index),
                buttonDay('Terça', diaryController, index),
                buttonDay('Quarta', diaryController, index),
                buttonDay('Quinta', diaryController, index),
                buttonDay('Sexta', diaryController, index),
                buttonDay('Sábado', diaryController, index),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

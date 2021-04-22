import 'package:flutter/material.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/book/book_screen.dart';

class ActivityTimePage extends StatefulWidget {
  ActivityTimePage({Key key}) : super(key: key);

  @override
  _ActivityTimePageState createState() => _ActivityTimePageState();
}

class _ActivityTimePageState extends State<ActivityTimePage> {
  MainController controller = MainController();
  Size mediaSize;
  bool aux = false;

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
                  'Por quanto tempo em geral você pretende realizar as atividades?',
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
                child: Wrap(
                  children: [
                    componentActivityTime(context, " 10 a 25 minutos"),
                    componentActivityTime(context, " 30 minutos"),
                    componentActivityTime(context, " 45 minutos"),
                    componentActivityTime(context, " 60 minutos"),
                  ],
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

  Widget componentActivityTime(BuildContext context, String label) {
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
              child: controller.activityTime == label
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
                controller.changedActivityTime(label);
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
}

import 'package:flutter/material.dart';

class Diary extends StatefulWidget {
  Diary({Key key}) : super(key: key);

  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(child: Text('Diário de Exercícios'),),
    );
  }
}
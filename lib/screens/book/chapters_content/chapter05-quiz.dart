import 'package:flutter/material.dart';
import 'package:movedor/models/Chapter.dart';

import 'components/custom_app_bar.dart';

class Chapter05Quiz extends StatefulWidget {
  static String routeName = "/chapter-05";
  @override
  _Chapter05QuizState createState() => _Chapter05QuizState();
}

class _Chapter05QuizState extends State<Chapter05Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(chapters[4]),
      body: Container(
        child: Text('Capitulo 05 - QUIZ'),
      ),
    );
  }
}
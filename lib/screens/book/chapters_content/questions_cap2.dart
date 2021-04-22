import 'package:flutter/material.dart';
import 'package:movedor/screens/book/chapters_content/components/body.dart';

class QuestionsChapter2 extends StatefulWidget {
  static String routeName = "/questionsChapter-02";
  @override
  _QuestionsChapter2State createState() => _QuestionsChapter2State();
}

class _QuestionsChapter2State extends State<QuestionsChapter2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Body(),
      ),
    );
  }
}

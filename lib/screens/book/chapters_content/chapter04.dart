import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movedor/components/default_button.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/models/Chapter.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'components/custom_app_bar.dart';
import 'components/top_rounded_container.dart';

class Chapter04 extends StatefulWidget {
  static String routeName = "/chapter-04";
  @override
  _Chapter04State createState() => _Chapter04State();
}

class _Chapter04State extends State<Chapter04> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);

    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: CustomAppBar(chapters[3]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  width: getProportionateScreenWidth(238),
                  height: getProportionateScreenWidth(238),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      chapters[4].image,
                      scale: 0.6,
                    ),
                  )),
              Row(children: []),
              TopRoundedContainer(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Text(
                          chapters[3].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Caso você experimente algum tipo de exercício que não o ajudou, isso não significa que o exercício físico não funciona ou não serve para você!\n",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Você sabia?!\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Existem vários grupos de exercícios nos postos de saúde. \n\nVeja quais são as opções mais próximas e as que você prefere.\n",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 20,
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            'assets/caps_illustrations/cap5-01.png',
                            scale: 0.6,
                          ),
                        ),
                        Text(
                          "\nExercícios e atividades que promovam o relaxamento e consciência corporal são importantes para o alívio da dor. \n\nExercícios de respiração, técnicas de relaxamento e meditação são opções que podem fazer parte do seu dia-a-dia",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        DefaultButton(
                            text: "Concluir capítulo",
                            press: () {
                              if (controller.lastChapter < 4) {
                                controller.lastChapter = 4;
                                FirebaseFirestore.instance
                                    .collection('users_v2')
                                    .doc(controller.id)
                                    .update({
                                  'book': {
                                    'last_chapter': controller.lastChapter,
                                    'questions': controller.finishedQuestions,
                                    'quiz': controller.finishedQuiz
                                  }
                                });
                              }
                              Navigator.of(context).pop();
                            }),
                        SizedBox(height: 20),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}

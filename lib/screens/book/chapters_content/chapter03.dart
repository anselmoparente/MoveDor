import 'package:flutter/material.dart';
import 'package:movedor/components/default_button.dart';
import 'package:movedor/models/Chapter.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'components/custom_app_bar.dart';
import 'components/top_rounded_container.dart';

class Chapter03 extends StatefulWidget {
  static String routeName = "/chapter-03";
  @override
  _Chapter03State createState() => _Chapter03State();
}

class _Chapter03State extends State<Chapter03> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(chapters[1]),
      body:
        SingleChildScrollView(
          child: 
            Column(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(238),
                  height: getProportionateScreenWidth(238),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(chapters[1].image, scale: 0.6,),
                  )
                ),
                Row(children: []),
                
                TopRoundedContainer(
                  color: Colors.white, 
                  child: 
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25 ),
                    child: Column(
                      children: [
                        Text(
                          chapters[1].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Posso me movimentar mesmo com dor? Sim, é seguro se movimentar! \n\nSe você já sentiu dor ao fazer determinado movimento, seu corpo pode guardar essa informação como uma memória ruim associada ao movimento.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 20,
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('assets/caps_illustrations/cap2-01.png', scale: 0.6,),
                        ),
                        Text(
                          "Em algumas pessoas, essa memória pode levar a comportamentos como evitar um movimento ou uma atividade, colaborando para a persistência da dor e da incapacidade.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 20,
                          ),
                        ),
                         AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('assets/caps_illustrations/cap2-02.png', scale: 0.6,),
                        ),
                        Text(
                          "O movimento pode romper esse ciclo!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "\nVocê não precisa começar pelo movimento mais desafiador! \n \nInicie por um movimento mais fácil e simples e avance para um mais difícil.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "\nVá aos poucos e respeite os limites do seu corpo!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "\nA dor pode aconder durante a atividade, mas não deve se manter nem aumentar após sua conclusão. \n\nAo se sentir seguro progrida aos poucos, até ganhar confiança para fazer o movimento livremente em toda a sua amplitude.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        DefaultButton(
                          text: "Concluir capítulo",
                          press: () => Navigator.of(context).pop()
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                )
              ],
            ),
        )
    );
  }
}
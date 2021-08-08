import 'package:flutter/material.dart';
import 'package:movedor/components/default_button.dart';
import 'package:movedor/size_config.dart';

import '../../../constants.dart';
import 'profile_items.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: mediaSize.width,
          height: mediaSize.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mediaSize.height * 0.05,
                ),
                Image.asset('assets/team.png'),
                SizedBox(
                  height: mediaSize.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Olá! Nós somos o MOVEDOR! Um aplicativo gratuito com o objetivo de trazer educaçãoem saúde com o tema Dor Lombar Crônica! O conteúdo do MOVEDOR é baseado em um estudo científico para desenvolvimento de material educativo para pessoas com dor lombar crônica.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: Color(0xff36a9b0),
                      fontSize: mediaSize.width * 0.05,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaSize.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Somos fruto do trabalho conjunto de várias pessoas, que se dedicaram com muito carinho para trazer o melhor para você! Esta é uma parceria do Projeto MOVIMENTO, do Departamento de Fisioterapia da Universidade Federal do Ceará em parceria com alunos e professores do Instituto Federal do Ceará!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: Color(0xff36a9b0),
                      fontSize: mediaSize.width * 0.05,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaSize.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Esse projeto foi desenvolvido por:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: Color(0xff36a9b0),
                      fontSize: mediaSize.width * 0.04,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaSize.height * 0.005,
                ),
                developersContainer(mediaSize, 'Conteúdo',
                    'Ana Carla Lima Nunes e Fabianna Moraleida'),
                SizedBox(
                  height: mediaSize.height * 0.01,
                ),
                developersContainer(mediaSize, 'Roteiro e funcionalidades',
                    'Ana Carla Lima Nunes, Fabianna Moraleida, Ana Ellen Nascimento e Mardeson Herculano Acácio'),
                SizedBox(
                  height: mediaSize.height * 0.01,
                ),
                developersContainer(mediaSize, 'Design',
                    'Mardeson Herculano Acácio e Vanessa Soares Mota Vieira'),
                SizedBox(
                  height: mediaSize.height * 0.01,
                ),
                developersContainer(
                    mediaSize, 'Vídeos', 'Mardeson Herculano Acácio'),
                SizedBox(
                  height: mediaSize.height * 0.01,
                ),
                developersContainer(mediaSize, 'Narração',
                    'Mardeson Herculano Acácio e Anna Larissa Sena Gonçalves'),
                SizedBox(
                  height: mediaSize.height * 0.01,
                ),
                developersContainer(mediaSize, 'Edição de som',
                    'Johnnie Brian Santos da Costa'),
                SizedBox(
                  height: mediaSize.height * 0.01,
                ),
                developersContainer(mediaSize, 'Programação',
                    'Anselmo Parente Martins, César Olavo, Isaac Gondim Geraldo, João Victor Freitas R. De Sousa, Lucas Alves Meneses, Samiris Sampaio de Albuquerque, Thiago Leal Menezes e Vinícius Menezes Monte'),
                SizedBox(
                  height: mediaSize.height * 0.01,
                ),
                developersContainer(mediaSize, 'Infográfico',
                    'Ana Eloise Ferreira Neves, Andreza Deyse Leal de Sousa, Alice Fortes Pereira, Arthur Anthunes Rangel da Silva, Isaac Santos Félix, Narciso Ferreira de Menezes Filho e Mardeson Herculano Acácio'),
                SizedBox(
                  height: mediaSize.height * 0.01,
                ),
                developersContainer(
                    mediaSize, 'Revisão', 'Ana Carla Lima Nunes'),
                SizedBox(
                  height: mediaSize.height * 0.01,
                ),
                developersContainer(mediaSize, 'Imagens e sons adicionais',
                    'Freepik (www.freepik.com) e Bensound (www.bensound.com)'),
                SizedBox(
                  height: mediaSize.height * 0.01,
                ),
              ],
            ),
          ),
        ));
  }

  Widget developersContainer(Size mediaSize, String type, String developers) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: TextStyle(
            fontFamily: 'MontserratRegular',
            color: Color(0xff36a9b0),
            fontSize: mediaSize.width * 0.04,
          ),
          children: <TextSpan>[
            TextSpan(text: type, style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ': '),
            TextSpan(
              text: developers,
            ),
          ],
        ),
      ),
    );
  }
}

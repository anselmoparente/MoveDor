import 'package:flutter/material.dart';
import 'package:movedor/components/default_button.dart';
import 'package:movedor/models/Chapter.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'components/custom_app_bar.dart';
import 'components/top_rounded_container.dart';

class Chapter00 extends StatefulWidget {
  static String routeName = "/chapter-00";
  @override
  _Chapter00State createState() => _Chapter00State();
}

class _Chapter00State extends State<Chapter00> {
  String nivelDor = "Falsa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("É fácil de machucar as suas costas",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Se você não for cuidadoso, você pode machucar suas costas",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Dor nas costas significa que você lesionou nas costas",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Uma 'fisgadinha' nas costas pode ser o primeiro sinal de uma lesão séria",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Se você tem dor nas costas, você deve evitar exercícios físicos",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Se você tem dor nas costas, você deveria se manter ativo",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Focar em outras coisas que não sejam as suas costas ajuda você a recuperar-se de dor nas costas",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Ter a expectativa de que sua dor nas costas vai melhorar, ajuda você à recuperar-se de dor nas costas",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Uma vez que você tenha tido dor nas costas, sempre existirá uma fraqueza",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Existe uma grande chance de que um episódio de dor nas costas não se resolverá",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
            ],
          ),
        ));
  }

  componentForms(BuildContext context, String label, String value) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.blue[200]),
                borderRadius: BorderRadius.circular(5),
              ),
              child: value == label
                  ? Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.black,
                    )
                  : Container(
                      height: 30,
                      width: 30,
                    ),
            ),
            onTap: () {
              setState(() {
                value = label;
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(label,
                style: TextStyle(
                  fontSize: 20,
                )),
          )
        ],
      ),
    );
  }
}

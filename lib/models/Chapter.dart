import 'package:flutter/material.dart';

class Chapter {
  final String image, title, description;

  Chapter({
    @required this.image,
    @required this.title,
    @required this.description,
  });
}

// Our demo Chapters

List<Chapter> chapters = [
  Chapter(
    image: "assets/caps_illustrations/cap1_illustration.png",
    title: "Conceitos básicos",
    description: "Entenda o que é ...",
  ),
  Chapter(
      image: "assets/caps_illustrations/cap3_illustration.png",
      title: "Medicamentos",
      description:
          "Para seguir-mos é preciso saber se você faz uso de algum medicamento."),
  Chapter(
    image: "assets/caps_illustrations/cap2_illustration.png",
    title: "Movimento é saúde!",
    description: "Saiba onde procurar tratamento ...",
  ),
  Chapter(
    image: "assets/caps_illustrations/cap4_illustration.png",
    title: "Exercício físico como tratamento",
    description: "Entenda como o exercício físico regular pode lhe ajudar!",
  ),
  Chapter(
    image: "assets/caps_illustrations/cap5_illustration.png",
    title: "Você não está sozinho",
    description: "Saiba onde pedir ajuda",
  ),
  Chapter(
    image: "assets/caps_illustrations/cap6_illustration.png",
    title: "Desmitificando a DLC",
    description: "Vamos responder algumas dúvidas a respeito da DLC!",
  ),
  Chapter(
    image: "assets/caps_illustrations/cap7_illustration.png",
    title: "Infográfico",
    description: "Veja uma explicação interativa sobre a DLC.",
  ),
];

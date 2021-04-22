import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "/search";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Pesquisa",
          style: TextStyle(color: kPrimaryColor, 
            fontSize: 30.0,
            fontWeight: FontWeight.bold,)
            ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movedor/components/default_button.dart';
import 'package:movedor/size_config.dart';

import '../../../constants.dart';
import 'profile_items.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "João Victor",
              style: headingStyle,
            ),
            Text(
              "freitasjoaovictor@gmail.com",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            ProfileItems(),
            DefaultButton(
              text: "Sair",
              press: () {},
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
          ],
        ),
      ),
    );
  }
}


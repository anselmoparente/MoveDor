import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
import '../screens/sign_up/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ainda não possui uma conta? ",
              style: TextStyle(fontSize: getProportionateScreenWidth(16)),
            ),
            Text(
              "Cadastre-se",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: kPrimaryColor),
            ),
          ],
        ));
  }
}

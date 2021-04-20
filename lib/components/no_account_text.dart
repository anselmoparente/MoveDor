import 'package:flutter/material.dart';
import 'package:movedor/screens/sign_in/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
      child:
      Row(
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
      )
    );
  }
}

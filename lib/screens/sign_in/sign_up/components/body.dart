import 'package:flutter/material.dart';
import 'package:movedor/components/social_card.dart';
import 'package:movedor/constants.dart';
import 'package:movedor/size_config.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                // Image.asset(
                //   "assets/images/illustrations/sign_up.gif",
                //   height: getProportionateScreenHeight(120),
                //   width: getProportionateScreenWidth(270),
                // ),
                Text("Criar conta", style: headingStyle),
                Text(
                  "Complete com os seus dados ou continue \no Facebook",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: getProportionateScreenHeight(20)),
                SocialCard(
                  text: "Facebook",
                  icon: "assets/icons/facebook-2.svg",
                  press: () {},
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'Ao criar a conta você concorda \ncom os nossos Termos e Condições de uso.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

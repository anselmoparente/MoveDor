import 'package:flutter/material.dart';
import 'package:movedor/size_config.dart';

const kPrimaryColor = Color(0xff36a9b0);
const kPrimaryLightColor = Color(0xffa9d6c2);
// const kPrimaryGradientColor = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   Color(0xFFFFA53E), Color(0xFFAA61A),
// );
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Por favor informe o seu Email";
const String kInvalidEmailError = "Por favor informe um Email válido";
const String kPassNullError = "Por favor informe a sua Senha";
const String kShortPassError = "A sua senha deve conter no mínimo 8 caracteres";
const String kMatchPassError = "As senhas não coincidem";
const String kNamelNullError = "Por favor informe o seu Nome";
const String kPhoneNumberNullError = "Por favor informe o seu Telefone";
const String kAddressNullError = "Por favor informe o seu Endereço";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

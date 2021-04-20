import 'package:flutter/widgets.dart';
import 'package:movedor/screens/book/chapters_content/chapter03.dart';
import 'package:movedor/screens/search/search_screen.dart';

import 'package:movedor/screens/splash/initial_splash.dart';
import 'package:movedor/screens/splash/splash_screen.dart';

import 'package:movedor/screens/sign_in/sign_in_screen.dart';
import 'package:movedor/screens/sign_in/sign_up/sign_up_screen.dart';

import 'package:movedor/screens/complete_profile/complete_profile_screen.dart';
import 'package:movedor/screens/profile/profile_screen.dart';

import 'package:movedor/screens/book/book_screen.dart';
import 'package:movedor/screens/book/chapters_content/chapter01.dart';
import 'package:movedor/screens/book/chapters_content/chapter02.dart';
import 'package:movedor/screens/book/chapters_content/chapter04.dart';
import 'package:movedor/screens/book/chapters_content/chapter05.dart';
import 'package:movedor/screens/book/chapters_content/chapter06-quiz.dart';
import 'package:movedor/screens/infographic/infographic_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreenInitial.routeName: (context) => SplashScreenInitial(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),

  // Pesquisa
  SearchScreen.routeName: (context) => SearchScreen(),

  // Livro e Capitulos
  BookScreen.routeName: (context) => BookScreen(),
  Chapter01.routeName: (context) => Chapter01(),
  Chapter02.routeName: (context) => Chapter02(),
  Chapter03.routeName: (context) => Chapter03(),
  Chapter04.routeName: (context) => Chapter04(),
  Chapter05.routeName: (context) => Chapter05(),
  Chapter06Quiz.routeName: (context) => Chapter06Quiz(),
  Infographic.routeName: (context) => Infographic(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};

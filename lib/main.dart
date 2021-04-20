import 'package:flutter/material.dart';
import 'package:movedor/routes.dart';
import 'package:movedor/screens/splash/initial_splash.dart';
import 'package:movedor/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoveDor',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreenInitial.routeName,
      routes: routes,
    );
  }
}

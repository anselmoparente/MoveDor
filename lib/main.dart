import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movedor/controllers/diary_controller.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/controllers/search_controller.dart';
import 'package:movedor/routes.dart';
import 'package:movedor/screens/splash/initial_splash.dart';
import 'package:movedor/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MainController>(create: (_) => MainController()),
        Provider<DiaryController>(create: (_) => DiaryController()),
        Provider<SearchController>(create: (_) => SearchController()),
      ],
      child: MaterialApp(
        builder: (context, child) {
          MainController controller = Provider.of<MainController>(context);
          DiaryController diaryController = Provider.of<DiaryController>(context);

          void id() async {
            var androidInfo = await DeviceInfoPlugin().androidInfo;
            controller.id = androidInfo.androidId;
          }
          id();
          Future.delayed(Duration(seconds: 1));
          controller.getMain();
          diaryController.getDiary(controller.id);

          return child;
        },
        debugShowCheckedModeBanner: false,
        title: 'MoveDor',
        theme: theme(),
        // home: SplashScreen(),
        // We use routeName so that we dont need to remember the name
        initialRoute: SplashScreenInitial.routeName,
        routes: routes,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Infographic extends StatefulWidget {
  static String routeName = "/infographic";
  final String title;
  const Infographic({Key key, this.title = "Infografico"}) : super(key: key);
  
  @override
  _InfographicState createState() => _InfographicState();
}

class _InfographicState extends State<Infographic> {
  // WebViewController _webViewController;
  String filePath = 'assets/infografico/index.html';

  @override
  void initState() { 
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  // final appState = Provider.of<AppController>(context);
  
    return Scaffold(
      body:
        SafeArea(
          child: WebView(
            onWebViewCreated: (WebViewController controller) {
              controller.loadAssetHtmlFile(filePath);
              // controller.loadLocalHtmlFile(url);
            },
            javascriptMode: JavascriptMode.unrestricted,
          ),
        )
    );
  }
}

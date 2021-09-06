import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'package:movedor/constants.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/models/Chapter.dart';
import 'package:movedor/screens/book/chapters_content/components/play_pause.dart';

import 'components/custom_app_bar.dart';
import 'components/play_pause.dart';
import 'components/top_rounded_container.dart';

class Chapter03 extends StatefulWidget {
  static String routeName = "/chapter-03";
  @override
  _Chapter03State createState() => _Chapter03State();
}

class _Chapter03State extends State<Chapter03> {
  bool finalizouChapter03 = false;

  VideoPlayerController _controller;

  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    _controller = VideoPlayerController.asset('assets/videos/cap3.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
    _controller.addListener(checkVideoStatus);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);

    if (finalizouChapter03 == true) {
      if (controller.lastChapter < 3) {
        controller.lastChapter = 3;
        FirebaseFirestore.instance
            .collection('users_v2')
            .doc(controller.id)
            .update({
          'book': {
            'last_chapter': controller.lastChapter,
            'questions': controller.finishedQuestions,
            'quiz': controller.finishedQuiz
          }
        });
      }
    }
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(chapters[2]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: 230,
                height: 230,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    chapters[2].image,
                    scale: 0.6,
                  ),
                )),
            TopRoundedContainer(
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      chapters[3].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 25,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller),
                            PlayPauseOverlay(controller: _controller),
                            VideoProgressIndicator(_controller,
                                allowScrubbing: true),
                          ],
                        ),
                      ),
                    )
                    // ProductDescription(
                    //   product,
                    // ),
                    // ProductPricing(product),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  checkVideoStatus() async {
    int duration = (_controller.value.duration.inSeconds * 0.9).toInt();

    ///Se a posição de progresso do vídeo for igual a 90% da duração do mesmo, então vou dar como finalizado o capítulo.
    if (_controller.value.position.inSeconds == duration) {
      setState(() {
        finalizouChapter03 = true;
      });
    }
  }
}
